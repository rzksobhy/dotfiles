PROMPT="%n@%m:%~$ "

stty intr ^E

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# vi-mode
bindkey -v
bindkey -M viins '^C' vi-cmd-mode

# some useful options (man zshoptions)
setopt menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

# shift+tab
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Fzf
export FZF_DEFAULT_OPTS='--layout=default --no-height --color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
export FZF_DEFAULT_COMMAND='fd --color=never --hidden'
export FZF_ALT_C_COMMAND='fd --color=never --hidden'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Alies
alias l="ls -al"
alias ll="ls -l"
alias ls="ls --color=auto"
alias vim=nvim
alias rg='rg --vimgrep'
