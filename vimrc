set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'Townk/vim-autoclose'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'wlangstroth/vim-racket'
Plug 'psf/black'

call plug#end()

filetype plugin indent on
syntax on

set laststatus=2
set t_Co=256

set encoding=utf-8
set tabstop=4
set shiftwidth=4
set autoindent
set magic
"set number

set ruler
"set cc=80
set nowrap

set ignorecase
set smartcase

set splitbelow
set hidden
set hlsearch
set mouse=a
set backupdir=~/.cache
set directory=~/.cache

set nofoldenable
set lazyredraw

let mapleader="\<space>"


" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/snippets"]

autocmd FileType c setlocal noet ts=8 sw=8
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType html setlocal et ts=2 sw=2

" fzf
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bt :BTags<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

