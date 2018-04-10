" Plug {{{
call plug#begin('~/.local/share/nvim/plugged')

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote'), 'tag': '*' }
"let g:deoplete#custom#set('jedi', 'debug_enabled', 1)
let g:deoplete#sources#jedi#debug_server = 1
let g:deoplete#enable_at_startup = 1

Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'   " mark modified lines
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'     " :TestNearest, :TestFile, :TestSuite, :TestLast
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'zchee/deoplete-jedi'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'gorodinskiy/vim-coloresque'   " shows CSS colors
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'       " Snippets are separated from the engine --> load separately
Plug 'mattn/gist-vim'
Plug 'joonty/vdebug'
Plug 'mattn/webapi-vim'
"Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
"Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
"Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
"Plug 'joonty/vim-phpqa'
"Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

":PlugInstall
" }}}

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Use local vimrc if available
"if filereadable(expand("~/.vimrc.local"))
"	source $HOME/.vimrc.local
"endif

set clipboard=unnamedplus
filetype plugin indent on
set number                               " enable line number
set rnu                                 " Relative line number
set secure                              " Enable secure mode
let mapleader = ","                     " Set the <Leader> for combo commands
set autoindent                          " Make sure that unrecognized files are still indented
set showcmd                             " Show (partial) commands (or size of selection in Visual mode) in the status
set showmatch                           " When a bracket is inserted, briefly jump to a matching one
syntax on
set encoding=utf-8
"set guifont=DejaVu\ Serif
set tabstop=4                           " Use 4 spaces for <Tab> and :retab
set expandtab                           " Expand tabs to spaces
set nowrap                              " do not wrap lines by default
set wildmenu                            " Use menu to show command-line completion (in 'full' case)
set incsearch                           " Enable incremental search
set hlsearch                            " Highlight results of a search
set ic                                  " Search ignore case
set smartcase                           " Ignore case only if seach string is all lowercase
set showtabline=2                       " Make sure that tabline is always present
set laststatus=2                        " Always show status line, even for one window
set matchtime=2                         " Jump to matching bracket for 2/10th of a second (works with showmatch)
set backupdir=/tmp
set directory=/tmp                      " Don't clutter my dirs up with swp and tmp files
set ruler                               " Show line, column number, and relative position within a file in the status
set scrolloff=10                       " Scroll when cursor gets within 10 characters of top/bottom edge
set shiftwidth=4                        " Use 4 spaces for (auto)indent
set background=dark                     " Background options
"set t_Co=256
colorscheme monokai-chris                   " Schema color
set exrc                                " Enable project specific .vimrc
"set spell                               " Enable spell check
set backspace=indent,eol,start

""""""""""
" NEOVIM "
""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $NVIM_TUI_ENABLE_CORSOR_SHAPE = 1

" custom key commands
noremap <Leader>m :<C-U>NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
vmap < <gv
vmap > >gv


""""""""
" misc "
""""""""
" dismiss highlighted search items on leader+space
nnoremap <leader><space> :noh<cr>
" f9 to turn on/off highlighting of the current line
nnoremap <silent><f9> :set cursorline!<cr>
" cycling through buffers
nnoremap <C-n> :bnext<CR>:redraw<CR>
nnoremap <C-p> :bprevious<CR>:redraw<CR>
" exit Terminal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""
" plugin customization "
""""""""""""""""""""""""
" remap ctrl p to <leader> t
let g:ctrlp_map = '<leader>t'
" map `;´ to open ctrl p in buffermode
nnoremap ; :CtrlPBuffer<CR>
" align selected lines on '='
map <leader>9 :Tabularize/=<cr>
" config identline
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1
" Ultisnips Trigger config
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Neosnippet config
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
