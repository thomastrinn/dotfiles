"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin manager (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'		" Lightline statusbar (https://github.com/itchyny/lightline.vim)

Plug 'ap/vim-css-color'			    " Color previews for CSS (https://github.com/ap/vim-css-color)

Plug 'ayu-theme/ayu-vim'            " ayu color

call plug#end()


filetype plugin indent on
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

"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
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
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting search results
set incsearch " highlight first match
" set hlsearch " highlight all match

