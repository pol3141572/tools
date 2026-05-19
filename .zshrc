# =========================
# .zshrc - green on black
# =========================

# Kleuren inschakelen
autoload -U colors && colors

# Forceer kleurondersteuning
export CLICOLOR=1
export TERM=xterm-256color

# Prompt: groen op zwart
# \e[32m = groen
# \e[40m = zwarte achtergrond
# \e[0m  = reset
PS1='%{\e[40m\e[32m%}%n@%m:%~ %# %{\e[0m%} '

# Optioneel: ls altijd gekleurd
alias ls='ls --color=auto'

# Minder vervuilde output (optioneel)
export LESS='-R'

# Zorg dat grep ook kleur gebruikt
alias grep='grep --color=auto'
