" specify dir for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized' 

" init plugin system
call plug#end()

" key mappings
:let mapleader = ","
:map <leader>nn :NERDTreeToggle<cr>
:map <leader>nf :NERDTreeFind<cr>
:map <leader>nb :NERDTreeFromBookmark<cr>
:inoremap jj <esc>
