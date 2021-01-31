" plugins {{{

set nocompatible

call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'nlknguyen/papercolor-theme'
    Plug 'morhetz/gruvbox'
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
    "Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'epilande/vim-react-snippets'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'alvan/vim-closetag'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" plugins }}}

" general sets {{{

syntax enable
filetype plugin on
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

" make cursor always vertically centre
set scrolloff=999
"augroup VCenterCursor
    "au!
    "au BufEnter,WinEnter,WinNew,VimResized *,*.*
                "\ let &scrolloff=winheight(win_getid())/2
"augroup END

" folding
set foldmethod=marker
set foldnestmax=10
set foldlevel=2
let g:vim_markdown_folding_disabled = 1
"set nofoldenable " unfold on start

" terminal splitting
set splitbelow
"set termwinsize=15x0

" theming
if (has("termguicolors"))
    set termguicolors
endif
colorscheme gruvbox
set background=dark

" to prevent old vim from black&white bug when using termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" tabs
set tabstop=4
set shiftwidth=4
set expandtab
augroup tabs
    autocmd!
    autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
    autocmd Filetype c setlocal shiftwidth=2 tabstop=2
augroup END
 
" general sets }}}

" key mappings {{{
set whichwrap+=<,>,h,l,[,] " wrap around when moving left/right

" abbrevs
ca t tabnew

" general mappings
let mapleader = ","
map <leader>tm :term<CR>
map <leader>so :so %<CR>
map <leader>lv :VimtexView<CR>
map <leader>ll :VimtexCompile<CR>
map <leader>lt :VimtexTocOpen<CR>
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nb :NERDTreeFromBookmark<CR>
nmap <leader>tb :TagbarToggle<CR>
map <leader>p "_dP
nnoremap <leader>ws :ToggleWorkspace<CR>
inoremap jj <esc>

" neovim terminal
:tnoremap <Esc> <C-\><C-n>

" coc refactoring
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)

" coc goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" navigate errors in code
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc list
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" key mappings }}}

" plugin config: vim-lexical {{{

augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType tex call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text,c,cpp,bib call lexical#init({ 'spell': 0 })
augroup END

" lexical dict settings
set spell spelllang=en
hi SpellBad ctermfg=red 
"cterm=underline 

" thesaurus
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#thesaurus_key = '<leader>tt'

" plugin config: vim-lexical }}}

" plugin config: nerdtree {{{

" open dir of current file in window when toggling nerdtree
augroup nerdTreeCD
    autocmd!
    autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h | endif 
augroup END

" plugin config: nerdtree }}}

" plugin config: vim-airline {{{
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'gruvbox'
" plugin config: vim-airline }}}

" plugin config: vimtex {{{

let g:tex_flavor = 'latex'
let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_viewer = "zathura"
"let g:vimtex_view_general_viewer = "okular"
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'

" plugin config: vimtex }}}

" plugin config: workspace {{{
let g:workspace_autosave_always = 1
let g:workspace_session_name = 'session.vim'
let g:workspace_autosave_untrailspaces = 0
" plugin config: workspace }}}

" plugin config: coc-snippets {{{

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" plugin config: coc-snippets }}}

" plugin config: vim-closetag {{{

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>`will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" plugin config: vim-closetag }}}

" plugin config: coc {{{
let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-python',
            \ 'coc-clangd',
            \ 'coc-vimtex',
            \ 'coc-pairs',
            \ 'coc-snippets',
            \ 'coc-prettier'
            \ ]
            "\ 'coc-ultisnips',
            "\ 'coc-xml',
            "\ 'coc-css',

" use tab and s-tab to navigate completion menu
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" documention with K
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

" enable prettier to format file automatically
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" plugin config: coc }}}
"
" misc hacks {{{

" change swapfiles and undodir locations
if !isdirectory($HOME . "/.vim/swapfiles") | call mkdir($HOME . "/.vim/swapfiles", "p") | endif
    set dir=$HOME/.vim/swapfiles//
if !isdirectory($HOME. "/.vim/undotree") | call mkdir($HOME . "/.vim/undotree", "p") | endif
    set undodir=$HOME/.vim/undotree//

" fix strange brackets in nerdtree after a re-source
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" tab to complete first in list or choose first snippet
"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? coc#_select_confirm() :
            "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap',['snippets-expand-jump',''])\<CR>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ coc#refresh()

" cancel autocomplete on backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" not sure what but some snippet thingy
let g:coc_snippet_next = '<tab>'

" misc hacks }}}
