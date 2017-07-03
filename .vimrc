" specify dir for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" init plugin system
call plug#end()

" key mappings
:let mapleader = ","
:map <leader>nn :NERDTreeToggle<cr>
:map <leader>nf :NERDTreeFind<cr>
:map <leader>nb :NERDTreeFromBookmark<cr>
:inoremap jj <esc>

" theme
syntax enable
set background=light
colorscheme peaksea
set background=dark

" code formatting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" status line
:set statusline+=%f         " Path to the file
:set statusline+=%=        " Switch to the right side
:set statusline+=%l        " Current line
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
