" general formatting
syntax enable
filetype plugin on
set nocompatible
set encoding=utf-8
set t_Co=256
set hidden

" lexical dict settings
set spell spelllang=en
hi SpellBad cterm=underline ctermfg=red

" terminal splitting
set splitbelow
set termwinsize=15x0

call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'nlknguyen/papercolor-theme'
	Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
    "Plug 'vim-syntastic/syntastic'
	Plug 'lervag/vimtex'
	"Plug 'honza/vim-snippets'
	Plug 'thaerkh/vim-workspace'
    Plug 'majutsushi/tagbar'
    Plug 'plasticboy/vim-markdown'
    Plug 'reedes/vim-lexical'
    "Plug 'nvie/vim-flake8'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'pangloss/vim-javascript'
    "Plug 'leafgarland/typescript-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'airblade/vim-gitgutter'
    "Plug 'Xuyuanp/nerdtree-git-plugin'

    "Plug 'Valloric/YouCompleteMe', { 'commit': 'd98f896', 'do': './install.py' }
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    "Plug 'sirver/ultisnips'
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    "Plug 'davidhalter/jedi-vim'
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

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" coc vim version warning suppression
let g:coc_disable_startup_warning = 1

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

" coc statusline support
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" enable prettier
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
map <leader>p "_dP
nnoremap <leader>ws :ToggleWorkspace<CR>
inoremap jj <esc>
"map <leader>f :YcmCompleter FixIt<CR>
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

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
"let g:workspace_undodir = '~/.vim/.undodir'

" youcompleteme
"augroup ycm
    "autocmd!
    "autocmd BufEnter *.tex let g:ycm_auto_trigger=0 
"augroup END
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
