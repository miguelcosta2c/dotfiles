# ~/.bashrc
# Arch Linux + Hyprland + Kitty Dracula Rice

# ┌──────────────────────────────────────┐
# │ Shell Options                        │
# └──────────────────────────────────────┘

export TERMINAL=kitty

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000


# ┌──────────────────────────────────────┐
# │ Colors (Dracula)                     │
# └──────────────────────────────────────┘

export LS_COLORS="di=38;5;141:fi=38;5;250:ln=38;5;81:ex=38;5;84"

purple="\[\e[38;5;141m\]"
cyan="\[\e[38;5;81m\]"
green="\[\e[38;5;84m\]"
pink="\[\e[38;5;212m\]"
white="\[\e[38;5;250m\]"
reset="\[\e[0m\]"


# ┌──────────────────────────────────────┐
# │ Prompt                               │
# └──────────────────────────────────────┘

parse_git_branch() {
    git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'
}

PS1='\[\e[38;5;141m\]╭─\[\e[38;5;81m\]\u\[\e[38;5;250m\]@\h \[\e[38;5;84m\]\w \[\e[38;5;141m\]\[\e[38;5;212m\]$(parse_git_branch)
\[\e[38;5;141m\]╰─\[\e[38;5;81m\]❯ \[\e[0m\]'


# ┌──────────────────────────────────────┐
# │ Aliases                              │
# └──────────────────────────────────────┘

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons'

alias grep='grep --color=auto'

alias c='clear'

alias update='sudo pacman -Syu'

alias install='sudo pacman -S'

alias remove='sudo pacman -Rns'

# ┌──────────────────────────────────────┐
# │ Hyprland                             │
# └──────────────────────────────────────┘

alias waybar-restart='pkill waybar && waybar > /dev/null 2>&1 &'


# ┌──────────────────────────────────────┐
# │ Git                                 │
# └──────────────────────────────────────┘

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'


# ┌──────────────────────────────────────┐
# │ Development                          │
# └──────────────────────────────────────┘

alias v='nvim'
alias nv='nvim'

alias py='python'


# ┌──────────────────────────────────────┐
# │ cmatrix                              │
# └──────────────────────────────────────┘

alias cmatrix='cmatrix -s -C magenta -u 10'
