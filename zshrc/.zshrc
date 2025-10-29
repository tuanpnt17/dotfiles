source ~/.local/share/zsh/rc
source $ZSH/oh-my-zsh.sh
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/tuanpnt17/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/tuanpnt17/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# opencode
export PATH=/home/tuanpnt17/.opencode/bin:$PATH
