#
#PPPPPPPP        OOOOOOOO        LLL
#PPPPPPPPPP    OOOOOOOOOOOO      LLL
#PPP     PPP  OOOO      OOOO     LLL
#PPP     PPP  OOOO      OOOO     LLL
#PPPPPPPPPP   OOOO      OOOO     LLL
P#PPPPPPP     OOOO      OOOO     LLL
#PPP          OOOO      OOOO     LLL
#PPP           OOOOOOOOOOOO      LLLLLLLLL
#PPP             OOOOOOOO        LLLLLLLLL
#
#
#
#==============#
####ALIASSEN####
#==============#
#
alias terug='cd ..'
alias ls='ls -a'
#
#================================================#
#---------------------TMUX-FNCTIES -----------------
# ============================================== #
tmuxstart() {
    # CASE 1: Functie aangeroepen ZONDER naam
    if [ -z "$1" ]; then
        echo -n "Geen sessienaam opgegeven. Voer een geschikte naam in: "
        read -r SESSIE_NAAM
        
        # Controleer of de gebruiker niet gewoon op enter heeft gedrukt
        if [ -z "$SESSIE_NAAM" ]; then
            echo "Fout: Sessienaam mag niet leeg zijn."
            return 1
        fi
        
        # Maak de nieuwe sessie aan en verbind direct
        tmux new-session -s "$SESSIE_NAAM"
        return 0
    fi

    # Sla de meegegeven naam op in een variabele voor de duidelijkheid
    SESSIE_NAAM="$1"

    # CASE 2: Functie aangeroepen MET naam
    # Controleer of de sessie al bestaat
    if tmux has-session -t "$SESSIE_NAAM" 2>/dev/null; then
        echo "Sessie '$SESSIE_NAAM' gevonden. Verbinden..."
        tmux attach-session -t "$SESSIE_NAAM"
    else
        # Sessie bestaat niet, vraag om bevestiging
        echo -n "Sessie '$SESSIE_NAAM' bestaat niet. Nieuwe sessie aanmaken? (y/n): "
        read -r ANTWOORD
        
        if [[ "$ANTWOORD" =~ ^[YyJj](es|a)?$ ]]; then
            tmux new-session -s "$SESSIE_NAAM"
        else
            echo "Actie geannuleerd."
            return 1
        fi
    fi
}
tmuxstop() {
    # Controleer of we daadwerkelijk binnen een tmux-sessie zitten
    if [ -n "$TMUX" ]; then
        tmux detach-client
    else
        echo "Je zit momenteel niet in een tmux-sessie."
    fi
}

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
