"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin manager (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'		" Lightline statusbar (https://github.com/itchyny/lightline.vim)

Plug 'ap/vim-css-color'			    " Color previews for CSS (https://github.com/ap/vim-css-color)

Plug 'arcticicestudio/nord-vim'     " Nord color schema

Plug 'Yggdroot/indentLine'          " Show vertical lines at each indentation level

Plug 'preservim/nerdtree'           " NERDTree: file system explorer (https://github.com/preservim/nerdtree)

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wrap

set scrolloff=8
set sidescrolloff=8

set number
set relativenumber

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2			        " Always show statusline
set noshowmode                      " prevent non-normal modes showing in lightline and below lightline.

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '▏'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schema
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable true colors support
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" set nord color theme
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key-bindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save file with CTRL+S (you must somehow disable interpreting CTRL+S by the
" terminal itself; zsh: unsetopt flow_control, bash: stty -ixon)
" see: https://www.rockyourcode.com/vim-trick-map-ctrl-s-to-save/
"
" for normal mode
nnoremap <silent><c-s> :<c-u>update<cr>
" for visual mode (preserves visual selection
vnoremap <silent><c-s> <c-c>:update<cr>gv
" for insert mode
inoremap <silent><c-s> <c-o>:update<cr>

" NERDTree toggle with CTRL+F
nmap <C-f> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                         " enable mouse for all modes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting search results
set incsearch                       " highlight first match
" set hlsearch                      " highlight all match

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert text to UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *   set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

" Going over all of this would take too much time
" This basically set everything in utf-8 in every circumtances

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert to UNIX fileformat (avoid CRLF)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
" Set every files as Unix (LF) as Windows might set CRLF wich is not working
" for unix

