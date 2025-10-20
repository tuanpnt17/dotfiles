neofetch
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto      # update automatically without asking
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# PATH
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# NodeJs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/opt/mssql-tools18/bin"
export PNPM_HOME="/home/tuanpnt17/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# dotnet
export DOTNET_ROOT=/usr/share/dotnet/
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# golang
# export PATH=$PATH:/usr/local/go/bin

# flutter
# export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"
export PATH="$HOME/Android/platform-tools/:$PATH"


# Alias
alias ta="tmux a"
alias v="nvim"
alias vim="nvim"
alias dot="cd ~/.dotfiles/"
alias y="yazi"
alias lg="lazygit"
alias oh="cd ~"
alias ogh="cd ~/Documents/github.com/"
alias oo="nvim ~/vaults/personal/Start.md"
alias ld="lazydocker"
alias za="zathura"
alias neo="neofetch"
alias mr="mvn spring-boot:run"

# open a note for billion $ idea
alias dn="nvim ~/Documents/github.com/scratch/notes_$(date +'%y%m%d').md"

# Alias tmuxifier
alias hsms="tmuxifier load-session hsms"
alias dsa="tmuxifier load-session dsa"
# alias tna="tmuxifier load-session tna"
# alias config="tmuxifier load-session config"

# Load Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# Load Angular CLI autocompletion.
# source <(ng completion script)


# Initialization 
eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# Input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# . "$HOME/.local/share/../bin/env"
