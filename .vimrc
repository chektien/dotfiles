" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" key mappings
let mapleader = ","
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>nb :NERDTreeFromBookmark<cr>
inoremap jj <esc>
set whichwrap+=<,>,h,l,[,]

" code formatting
set tabstop=4
set shiftwidth=4
set expandtab

" status line
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=col:%c    " Current character 
set statusline+=\ line:%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_include_dirs = ['/usr/local/Cellar/sfml/2.4.2/include']
let g:syntastic_cpp_compiler_options = '-std=c++11'

" theme
set t_Co=256
syntax enable
set background=dark
colorscheme peaksea
