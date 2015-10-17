
# Executes commands at the start of an interactive session.
#
# Authors:
#   Siddharth Gollapudi <siddharthgollapudi99@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#prompt sorin
source /Users/siddharth/.zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# PROMPT="%{$fg[red]%}%n %{$fg_no_bold[green]%}%1~ %{$reset_color%}$ "
alias vim='/usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim'
alias la='ls -a'
alias winedir='cd /Users/siddharth/.wine/drive_c'
alias eclimd='./Downloads/eclipse/eclimd'
alias rm='rm -rf'
source "$HOME/.vim/gruvbox_256palette_osx.sh"
export GOPATH=$HOME/.Go
alias C='cd /Users/siddharth/AndroidStudioProjects/extraneous/CLanguages'

function _git_files {
	_wanted files expl 'local files' _files
}
