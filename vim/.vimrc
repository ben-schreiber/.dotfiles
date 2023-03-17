set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-python/python-syntax'
Plugin 'ervandew/supertab'
Plugin 'mhartington/oceanic-next'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'mechatroner/rainbow_csv'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'ivanovyordan/dbt.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
let python_highlight_all=1
syntax on

set shortmess+=I
set number
set relativenumber
set laststatus=2

set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb=
set mouse+=a

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

if (has("termguicolors"))
  set termguicolors
 endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'file': '.pyc',
            \ 'dir': '__pycache__',
            \ }

" Changing cursor and highlighting line when in insert mode
autocmd InsertEnter,InsertLeave * set cul!
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set ttimeout
set ttimeoutlen=1
set ttyfast
set updatetime=100


" DBT
let g:dbt_highlight_jinja  = 1
