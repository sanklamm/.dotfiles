syntax enable
let g:solarized_termtrans = 1
colorscheme solarized

let mapleader=","

set relativenumber 
set number 

" sane search options
set ignorecase
set incsearch
set hlsearch

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Automatic reloading of . vimrc
autocmd! bufwritepost .vimrc source %

" Better copy&paste
set pastetoggle=<F2>
set clipboard=unnamed

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" vim-plug --> Plugin-Manager
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim' 		" fuzzy find files
Plug 'scrooloose/nerdtree' 	" file drawer, open with :NERDTreeToggle
Plug 'tpope/vim-commentary' 	" comment/uncomment lines with gcc or gc in visual mode

call plug#end()
