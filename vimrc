set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
"Plug 'SirVer/ultisnips'
Plug 'wlangstroth/vim-racket'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
"Plug 'psf/black'

call plug#end()

filetype plugin indent on
syntax on

set laststatus=2
set t_Co=256

set termguicolors
"colorscheme base16-ocean

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
set nobackup

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
nnoremap <leader>d :GFiles<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader><C-l> :Lines<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :BTags<cr>

