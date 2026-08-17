#!/bin/bash

# Requer: playerctl, jq, notify-send
# Define os players prioritários
PLAYERS="spotify,ncspot"

# Função para enviar a notificação da música atual
send_notification() {
    STATUS=$(playerctl --player=$PLAYERS status 2>/dev/null)
    if [ "$STATUS" = "Playing" ]; then
        ARTIST=$(playerctl --player=$PLAYERS metadata artist 2>/dev/null)
        TITLE=$(playerctl --player=$PLAYERS metadata title 2>/dev/null)
        notify-send -r 9991 -i spotify "Tocando agora:" "$ARTIST - $TITLE"
    fi
}

# Se o script receber "next", "prev" ou "toggle", ele controla o player
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

# Loop principal: usa \t como separador (não quebra com aspas/acentos)
# e monta o JSON com jq, que escapa corretamente qualquer caractere
# especial no nome do artista/música (aspas, barras, unicode, etc.)
playerctl --player=$PLAYERS metadata --format $'{{status}}\t{{artist}}\t{{title}}' --follow 2>/dev/null | \
while IFS=$'\t' read -r status artist title; do

    send_notification &

    case "$status" in
        Playing)
            text=" ${artist} - ${title}"
            ;;
        Paused)
            text="⏸ ${artist} - ${title}"
            ;;
        *)
            text=""
            ;;
    esac

    jq -nc --arg text "$text" --arg class "$status" --arg alt "$status" \
        '{text: $text, class: $class, alt: $alt}'
done
