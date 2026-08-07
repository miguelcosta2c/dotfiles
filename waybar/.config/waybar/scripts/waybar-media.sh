#!/bin/bash

# Define os players prioritários
PLAYERS="spotify,ncspot"

# Função para enviar a notificação da música atual
send_notification() {
    # Evita disparar se estiver pausado ao iniciar
    STATUS=$(playerctl --player=$PLAYERS status 2>/dev/null)
    if [ "$STATUS" = "Playing" ]; then
        ARTIST=$(playerctl --player=$PLAYERS metadata artist 2>/dev/null)
        TITLE=$(playerctl --player=$PLAYERS metadata title 2>/dev/null)

        # Envia a notificação (substitui a anterior usando o ID para não acumular)
        notify-send -r 9991 -i spotify "Tocando agora:" "$ARTIST - $TITLE"
    fi
}

# Se o script receber o argumento "next", "prev" ou "toggle", ele controla o player
case "$1" in
    next)
        playerctl --player=$PLAYERS next
        sleep 0.5 && send_notification
        exit 0
        ;;
    prev)
        playerctl --player=$PLAYERS previous
        sleep 0.5 && send_notification
        exit 0
        ;;
    toggle)
        playerctl --player=$PLAYERS play-pause
        exit 0
        ;;
esac

# Loop principal para alimentar o Waybar dinamicamente
playerctl --player=$PLAYERS metadata --format '{"text": "{{status}}: {{artist}} - {{title}}", "class": "{{status}}", "alt": "{{status}}"}' --follow 2>/dev/null | while read -r line; do

    # Executa a notificação em segundo plano toda vez que o playerctl mudar de faixa
    send_notification &

    # Ajusta o texto para remover as tags brutas e deixar amigável para o Waybar
    CLEAN_LINE=$(echo "$line" | sed 's/Playing: //g' | sed 's/Paused: /⏸ /g')
    echo "$CLEAN_LINE"
done
