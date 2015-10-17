set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'whatyouhide/gotham'
Plugin 'morhetz/gruvbox'
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'

call vundle#end()         
filetype plugin indent on

let g:airline_powerline_fonts = 1
set laststatus=2
set omnifunc=syntaxcomplete#Complete
let g:ycm_global_ycm_extra_conf='/Users/siddharth/.ycm_global_ycm_extra_conf'
let g:airline_theme='luna'
set encoding=utf-8
set term=xterm-256color
set mouse=a
colorscheme gotham
syntax on
set tags=~/.tags

let g:EclimCompletionMethod = 'omnifunc'
