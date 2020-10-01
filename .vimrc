" general formatting
syntax enable
filetype plugin on
set nocompatible
set encoding=utf-8
set t_Co=256

" lexical dict settings
set spell spelllang=en
hi SpellBad cterm=underline ctermfg=red

" terminal splitting
set splitbelow
set termwinsize=15x0

call plug#begin('~/.vim/plugged')
    Plug 'nlknguyen/papercolor-theme'
	Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-syntastic/syntastic'
	Plug 'lervag/vimtex'
	Plug 'honza/vim-snippets'
	Plug 'thaerkh/vim-workspace'
	Plug 'majutsushi/tagbar'
	Plug 'plasticboy/vim-markdown'
    Plug 'reedes/vim-lexical'
    Plug 'nvie/vim-flake8'
    Plug 'Valloric/YouCompleteMe', { 'commit': 'd98f896', 'do': './install.py --all' }
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'sirver/ultisnips'
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    "Plug 'davidhalter/jedi-vim'
	"Plug 'pangloss/vim-javascript'
call plug#end()

" theming
colorscheme PaperColor
set background=dark
"set number
"set laststatus=2

" vim tabs
set tabstop=4
set shiftwidth=4
set expandtab

" compile and run python
augroup compilations
    autocmd!
    autocmd Filetype python map <buffer> <leader>ct :w<CR><c+w><c+w>
    autocmd Filetype python map <buffer> <leader>cp :w<CR>:!python %<CR>
    autocmd Filetype python imap <buffer> <leader>cp <esc>:w<CR>:!python %<CR>
augroup END

" vim-lexical
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType tex call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'papercolor'

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_viewer = "zathura"
"let g:vimtex_view_general_viewer = "okular"
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'

" key mappings
let mapleader = ","
map <leader>hd :Toc<CR>
map <leader>tm :term<CR>
map <leader>lv :VimtexView<CR>
map <leader>ll :VimtexCompile<CR>
map <leader>tt :TagbarToggle<CR>
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nb :NERDTreeFromBookmark<CR>
map <leader>p "_dP
map <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>ws :ToggleWorkspace<CR>
inoremap jj <esc>

set whichwrap+=<,>,h,l,[,]

" nerdtree
" open dir of current file in window when toggling nerdtree
augroup nerdTreeCD
    autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h | endif 
augroup END

" workspace
let g:workspace_autosave_always = 1
let g:workspace_session_name = 'session.vim'
let g:workspace_autosave_untrailspaces = 0

" youcompleteme
au bufenter *.tex let g:ycm_auto_trigger=0 
"let g:ycm_semantic_triggers = { 'tex': [] }
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_confirm_extra_conf = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-javascript
" let g:javascript_plugin_jsdoc = 1

" " Set up the arrays to ignore for later
" if !exists('g:syntastic_html_tidy_ignore_errors')
"     let g:syntastic_html_tidy_ignore_errors = []
"     endif
"     " Ignore a-frame tags in HTML syntax checking
"     " See http://stackoverflow.com/questions/30366621
"     " ignore errors about Ionic tags
"     let g:syntastic_html_tidy_ignore_errors += ["<a-", "discarding
"     unexpected </a-"]
