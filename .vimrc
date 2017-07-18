" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'thaerkh/vim-workspace'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

" key mappings
let mapleader = ","
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>nb :NERDTreeFromBookmark<cr>
nnoremap <leader>s :ToggleWorkspace<CR>
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
set statusline+=\ line:%l " Current line
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
let g:syntastic_cpp_compiler_options = '-std=c++14'

" youcompleteme
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" detect file changes on disk
au FileChangedShell * echo "Warning: file changed on disk"

"let g:solarized_termcolors=256
set t_Co=256
syntax enable
set background=dark
colorscheme peaksea
