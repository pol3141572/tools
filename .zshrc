#
alias terug='cd ..'
alias ls='ls -a'
#
# ===== MATRIX TERMINAL THEME =====

# Enable colors
autoload -U colors && colors

# Terminal colors
export TERM=xterm-256color

# Green matrix palette
BLACK='%F{0}'
GREEN='%F{46}'
DARKGREEN='%F{22}'
RESET='%F{46}'

# Prompt styling
setopt PROMPT_SUBST

PROMPT='
${GREEN}┌─[${DARKGREEN}%n${GREEN}@${DARKGREEN}%m${GREEN}][${DARKGREEN}%~${GREEN}]
└╼ ${GREEN}$ ${RESET}'

# Command execution time
RPROMPT='${DARKGREEN}%*${RESET}'

# Matrix-style ls colors
export LSCOLORS="gxfxcxdxbxegedabagacad"

# Better completion colors
zstyle ':completion:*' list-colors 'di=32:fi=37:ln=36'
