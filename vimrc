call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

syntax on
filetype on
filetype plugin on
filetype indent on

set termguicolors
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

"shut up
set noerrorbells

"set clipboard+=unnamedplus

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_keepj = "keepj"
let g:netrw_list_hide = '*\.swp$,.DS_Store,__pychache__'


" Mappings
let mapleader="\<space>"

nnoremap <leader>sv :source $MYVIMRC<CR>

" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :BLines<cr>

