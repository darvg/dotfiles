set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:neocomplete#enable_at_startup = 1
set guifont=CamingoCode\ Regular:h14
if has("gui_running")
  colorscheme jellybeans
endif
