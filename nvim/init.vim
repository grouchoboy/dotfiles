call plug#begin(stdpath('data') . './plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'chriskempson/base16-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()

syntax on
filetype on
filetype plugin on
filetype indent on

syntax sync minlines=256

" Shut up
set noerrorbells
set visualbell

set clipboard+=unnamedplus

set laststatus=2
set encoding=utf-8
set autoindent
set magic
set mouse=a
set number
set ignorecase
set smartcase

set termguicolors
colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_keepj="keepj"
let g:netrw_list_hide= '.*\.swp$,.DS_Store,__pycache__,'


""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""
" <leader> is space
let mapleader="\<space>"

" Move around splits with <C-[hjkl]> in normal mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move visual block selection with <C-[jk]> in visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '>-2<CR>gv=gv

" fzf
nnoremap <C-p>f :Files<cr>
"nnoremap <leader>f :Files<cr>
nnoremap <C-p>b :Buffers<cr>
"nnoremap <leader>b :Buffers<cr>
nnoremap <C-p>l :BLines<cr>
"nnoremap <leader>l :BLines<cr>
nnoremap <C-p>t :Tags<cr>
"nnoremap <leader>t :Tags<cr>
nnoremap <C-p>r :BTags<cr>
"nnoremap <leader>r :BTags<cr>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set completeopt=menu,menuone,noselect

if executable('rg')
	set grepprg=rg\ --vimgrep
endif

lua require('config')

