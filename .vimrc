"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin manager (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'		" Lightline statusbar (https://github.com/itchyny/lightline.vim)

Plug 'ap/vim-css-color'			    " Color previews for CSS (https://github.com/ap/vim-css-color)

Plug 'ayu-theme/ayu-vim'            " ayu color

call plug#end()

filetype plugin indent on
" a combination of these commands:
"filetype on                        " filetype 'detection': try to recognize the type of the file 
"filetype plugin oni                " This actually loads the file 'ftplugin.vim' in 'runtimepath'.
                                    " The result is that when a file is edited its plugin file is loaded (if there
                                    " is one for the detected filetype).
"filetype indent on                 " This actually loads the file 'indent.vim' in 'runtimepath'.
                                    " The result is that when a file is edited its indent file is loaded (if there
                                    " is one for the detected filetype). indent-expression

set number                          " Show line numbers
syntax on                           " Enable syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2			        " Always show statusline
set noshowmode                      " prevent non-normal modes showing in lightline and below lightline.

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable true colors support
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

"let ayucolor="light"               " for light version of theme
let ayucolor="mirage"               " for mirage version of theme
"let ayucolor="dark"                " for dark version of theme
colorscheme ayu

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting search results
set incsearch                       " highlight first match
" set hlsearch                      " highlight all match

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert text to UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *   set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

"Going over all of this would take too much time
"This basically set everything in utf-8 in every circumtances

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert to UNIX fileformat (avoid CRLF)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
"Set every files as Unix (LF) as Windows might set CRLF wich is not working
"for unix

