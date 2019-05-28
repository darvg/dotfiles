"set colorscheme
colorscheme base16-material-palenight
"colorscheme gruvbox
set termguicolors

"==========================="
"          options          "
"==========================="
set ruler
set number
set cursorline
set cinkeys-=:
set nocp
syntax on
set nobackup
set noswapfile
set noshowmode
set expandtab
set smarttab
set incsearch
set hidden

set shortmess+=c
set background=dark
set encoding=utf-8
set mouse=a
set completeopt=longest,menuone,noinsert,noselect
set completeopt-=preview
set softtabstop=4
set shiftwidth=4
set tabstop=4

"adjust colors
hi LineNr guibg=NONE guifg=8
hi CursorLine guibg=0 guifg=NONE
hi CursorLineNr guibg=2 guifg=1


"==========================="
"          plugins          "
"==========================="
call plug#begin('~/.config/nvim/bundle/')

Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'SirVer/Ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}

call plug#end()


"==========================="
"          airline          "
"==========================="
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'

"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'coc']

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '≡'
let g:airline_symbols.maxlinenr = ''


"==========================="
"       autocomplete        "
"==========================="

"deoplete
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.cpp = '[^. *\t]\.\w*|[^. *\t]\::\w*|[^. *\t]\->\w*|#include\s*[<"][^>"]*'
let g:deoplete#omni#functions={}
let g:deoplete#omni#functions.cpp = ['LanguageClient#complete']
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 0

"ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()


"==========================="
"         Ultisnips         "
"==========================="
let g:ulti_expand_res = 0 "default value, just set once
function! CompleteSnippet()
  if empty(v:completed_item)
    return
  endif

  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res > 0
    return
  endif
  
  let l:complete = type(v:completed_item) == v:t_dict ? v:completed_item.word : v:completed_item
  let l:comp_len = len(l:complete)

  let l:cur_col = mode() == 'i' ? col('.') - 2 : col('.') - 1
  let l:cur_line = getline('.')

  let l:start = l:comp_len <= l:cur_col ? l:cur_line[:l:cur_col - l:comp_len] : ''
  let l:end = l:cur_col < len(l:cur_line) ? l:cur_line[l:cur_col + 1 :] : ''

  call setline('.', l:start . l:end)
  call cursor('.', l:cur_col - l:comp_len + 2)

  call UltiSnips#Anon(l:complete)
endfunction

autocmd CompleteDone * call CompleteSnippet()

let g:UltiSnipsExpandTrigger="<NUL>"
let g:UltiSnipsListSnippets="<NUL>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"==========================="
"            LSP            "
"==========================="
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['ccls'],
  \ 'python': ['pyls'],
  \ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_autoStart = 1


"==========================="
"         keybinds          "
"==========================="
let mapleader="\<space>"
let g:mapleader="\<space>"

" faster save/save+q/q
nmap <leader>w :w!<cr>
nmap <leader>wq :wq<cr>
nmap  <leader>q :q!<cr>

"nerdtree crap
map <leader>nt :NERDTreeToggle<cr>

"buffers
map <leader>tc :tabclose<cr>
map <leader>tn :tabnew<cr>
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


