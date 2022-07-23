call plug#begin()

Plug 'arcticicestudio/nord-vim'
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
colorscheme nord
let g:airline_theme='nord'

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
nnoremap <C-p>f :Files<cr>
nnoremap <C-p>b :Buffers<cr>
nnoremap <C-p>l :BLines<cr>

