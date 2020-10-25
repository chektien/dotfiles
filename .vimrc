" plugins
call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'nlknguyen/papercolor-theme'
	Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
	Plug 'lervag/vimtex'
	Plug 'thaerkh/vim-workspace'
    Plug 'majutsushi/tagbar'
    Plug 'plasticboy/vim-markdown'
    Plug 'reedes/vim-lexical'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" general formatting
syntax enable
filetype plugin on
set nocompatible
set encoding=utf-8
set t_Co=256
set hidden
set autoread " refresh when file changed elsewhere
set autowrite " save when leave modified buffer
set nobackup " no backup original files
set nowritebackup
set undofile " persistent undo
set undolevels=1000
set number relativenumber "relative line numbers
set updatetime=300 " for coc to work better
set shortmess+=c " coc to work better

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" lexical dict settings
set spell spelllang=en
hi SpellBad cterm=underline ctermfg=red

" terminal splitting
set splitbelow
set termwinsize=15x0

" theming
colorscheme PaperColor
set background=dark

" tabs
set tabstop=4
set shiftwidth=4
set expandtab
augroup js
    autocmd!
    autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
augroup END

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" coc extensions
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-python',
            "\ 'coc-xml',
            "\ 'coc-css',
            \ 'coc-prettier'
            \ ]

" coc use tab and s-tab to navigate completion menu
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc abort completion menu when backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" coc documention with K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " .
        expand('<cword>')
    endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
" }}} plugin config for coc "

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

" enable prettier to format file automatically
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
nmap <leader>tb :TagbarToggle<CR>
map <leader>p "_dP
nnoremap <leader>ws :ToggleWorkspace<CR>
inoremap jj <esc>
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)

" coc applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

set whichwrap+=<,>,h,l,[,]

" nerdtree
" open dir of current file in window when toggling nerdtree
augroup nerdTreeCD
    autocmd!
    autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h | endif 
augroup END

" workspace
let g:workspace_autosave_always = 1
let g:workspace_session_name = 'session.vim'
let g:workspace_autosave_untrailspaces = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" change swapfiles and undodir locations
" Make cursor always on center of screen by default
if !isdirectory($HOME . "/.vim/swapfiles") | call mkdir($HOME . "/.vim/swapfiles", "p") | endif
    set dir=$HOME/.vim/swapfiles//
if !isdirectory($HOME. "/.vim/undotree") | call mkdir($HOME . "/.vim/undotree", "p") | endif
    set undodir=$HOME/.vim/undotree//

" fix strange brackets in nerdtree after a re-source
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
