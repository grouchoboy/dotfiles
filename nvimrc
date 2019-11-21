set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'wlangstroth/vim-racket'
Plug 'psf/black'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'

call plug#end()

filetype plugin indent on
syntax on

set laststatus=2
set t_Co=256

set termguicolors
colorscheme base16-ocean

set encoding=utf-8
set tabstop=4
set shiftwidth=4
set autoindent
set magic
set number

set ruler
"set cc=80
set nowrap

set ignorecase
set smartcase

set splitbelow
set hidden
set hlsearch
set mouse=a

set nofoldenable
set lazyredraw

let mapleader="\<space>"

" python interpreter
let g:python3_host_prog = '/Users/manu/.pyenv/versions/3.8.0/bin/python3.8'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/snippets"]

autocmd FileType c setlocal noet ts=8 sw=8
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType js setlocal et ts=2 sw=2

" fzf
nnoremap <leader>d :GFiles<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader><C-l> :BLines<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :BTags<cr>

nnoremap <leader>k :Black<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

" coc
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

set statusline^=%{coc#status()}
