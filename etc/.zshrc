export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="juanghurtado"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  common-aliases
  debian
  git
  npm
)
source $ZSH/oh-my-zsh.sh
