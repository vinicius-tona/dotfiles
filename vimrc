" vim:fdm=marker
" Author: Samuel Masuy and the vim community.

" set noro

" Tip:
" "ap: put (print) content of macro in register a.
" "ayy: put back current line in register a (macro).
" switch to last place edited: ''
" <C-o> in insert mode is awesome
" To make a portable tar vim:
" bash <(curl -L https://raw.githubusercontent.com/junegunn/myvim/master/myvim)

" Pre vim  --------------------------------------------------------------- {{{

" Automatic reloading of vimrc
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

if has('nvim')
  call plug#begin('~/.config/nvim/plugged')

  Plug 'samuelmasuy/vim-toggle-js-test'

  " Essential
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-eunuch' " Adds Unix commands to vim.
  Plug 'tpope/vim-surround' " To change surrounding quote: cs(' ;tag cst<th> ;to add quote ysW'
  Plug 'tpope/vim-vinegar' " Enhance netrw
  Plug 'tpope/vim-abolish' " Camel case, snake crc
  Plug 'tpope/vim-markdown'

  " Plug 'benekastah/neomake'
  Plug 'w0rp/ale'


  Plug 'fatih/vim-go', {'for': ['go']}

  " auto completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go']}
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript'] }
  " Plug 'zchee/deoplete-jedi', {'for': ['python']}
  " Plug 'zchee/deoplete-clang', {'for': ['cpp']}

  " snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " js
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript'] }
  Plug 'pangloss/vim-javascript'
  Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'typescript']}

  " ts
  Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
  Plug 'bdauria/angular-cli.vim', { 'for': ['typescript'] }
  Plug 'mhartington/nvim-typescript', {'for': ['typescript']}
  Plug 'Shougo/echodoc.vim', {'for': ['typescript']}

  " markdown
  Plug 'rhysd/vim-grammarous', { 'for': ['text', 'markdown']}
  Plug 'ron89/thesaurus_query.vim', { 'for': ['text', 'markdown']}
  Plug 'chrisbra/unicode.vim', { 'for': ['text', 'markdown']}
  Plug 'JamshedVesuna/vim-markdown-preview'

  " python
  Plug 'davidhalter/jedi-vim', {'for': ['python']}

  " colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'mhartington/oceanic-next'
  Plug 'lifepillar/vim-wwdc16-theme'
  Plug 'junegunn/seoul256.vim'
  Plug 'joshdick/onedark.vim'

  Plug 'vim-airline/vim-airline'

  " search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'junegunn/vim-peekaboo'

  " tmux
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'

  " utils
  Plug 'EinfachToll/DidYouMean'
  Plug 'mhinz/vim-startify'
  Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
  Plug 'Valloric/MatchTagAlways'
  Plug 'Valloric/ListToggle'
  Plug 'vim-scripts/DirDiff.vim' " :DirDiff <A:Src Directory> <B:Src Directory>
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'godlygeek/tabular'
  Plug 'vim-scripts/visSum.vim'
  Plug 'mbbill/undotree'

  Plug 'Chiel92/vim-autoformat'

  call plug#end()
endif

" Better copy & paste.
if has('mac')
  set clipboard=unnamed
elseif has('unix') && (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
  set clipboard+=unnamedplus
endif

" See the commands typed in the right bottom corner.
set showcmd

if !has('nvim')
  " Make backspace behave like normal.
  set bs=2
  " Auto Indent
  set autoindent
endif

filetype plugin indent on

" ------------------------------------------------------------------------ }}}
" Appearance  ------------------------------------------------------------ {{{
" Enable syntax highlighting.
syntax on

set background=dark

" Beautiful
if has('nvim') && has("termguicolors")
  set termguicolors
  silent! colorscheme onedark
  let g:airline_theme = 'onedark'
elseif has('gui_running')
  set macligatures
  set guifont=Fira\ Code:h15
  silent! colorscheme OceanicNext
  let g:airline_theme = 'oceanicnext'
else
  set t_Co=256
  silent! colorscheme gruvbox
  let g:gruvbox_italicize_comments=0
  let g:airline_theme = 'powerlineish'
endif

" ------------------------------------------------------------------------ }}}
" Miscellaneous settings ------------------------------------------------- {{{

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
" Show the line that have been wrapped.
let &showbreak='↪ '
" Gdiff vertical split
set diffopt+=vertical
" Completion options (select longest + show menu even if a single match is found)
" set completeopt=menuone,noselect
" set completeopt+=noselect
autocmd CompleteDone * pclose
" Make Esc work faster.
set ttimeoutlen=40
" Always shows 5 lines above/below the cursor.
set scrolloff=5
" Increment decimal not octal numbers.
set nrformats=
" Horizontal split goes to the bottom.
set splitbelow
" Vertical split goes to the right.
set splitright
" Automatically reread changed files without asking me anything
set autoread
" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" Colorize the 100th column if goes over.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

" Showing line numbers and length.
set relativenumber
" Show current line numbers.
set number
" Width of document.
set tw=79
" Don't automatically wrap on load.
set nowrap
" Don't automatically wrap text when typing.
set fo-=t

if !has('nvim')
  " Useful settings.
  set history=700
  " Make search case insensitive.
  set hlsearch
  set incsearch
  " Tab-completion options.
  set wildmenu
endif

" How many undos
set undolevels=1000
" Undo file
set undodir=~/.config/nvim/undos
set undofile

set ignorecase
set smartcase

" Wildmode aka tab-completion options.
set wildmode=full

" for argdo and bufdo without a trailing bang.
set hidden

" Disable backup and swap files.
set nobackup
set nowritebackup
set noswapfile

" Disable mouse click to go to position
set mouse-=a

set noshowmode

" ------------------------------------------------------------------------ }}}
" General Mapping  ------------------------------------------------------- {{{

" cnoremap wq :echo 'Use ZZ'<CR>
" Disable un-VI keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Quick Fold and Unfold.
nnoremap <space> za
vnoremap <space> zf

" Make sure to be in the middle of the screen when searching.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier indentation of code blocks.
vnoremap < <gv
vnoremap > >gv

" basic, why not before
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" logical
nnoremap Y y$

" Switch marks
nnoremap ' `
nnoremap ` '

nnoremap <leader>dup :diffupdate<CR>

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

if has('nvim')
  " Terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" ------------------------------------------------------------------------ }}}
" Syntax support  -------------------------------------------------------- {{{
" python
" ------
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 formatoptions=croqj softtabstop=4 comments=:#\:,:#
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let python_highlight_all=1
let python_slow_sync=1
" let g:neomake_python_flake8_maker = {
"       \ 'args': [
"       \ '--ignore=E121,E124,E126,E261,E301,E303,E501,E721',
"       \ '--max-line-length=104']
"       \ }
" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E128 continuation line under-indented for visual indent
"   E261 at least two spaces before inline comment
"   E301 expected 1 blank line, found 0
"   E303 expected 2 blank lines, found <n>
"   E721 do not compare types, use 'isinstance()'
" let g:neomake_python_enabled_makers = ['flake8', 'python']
autocmd BufLeave *.py               normal! mP

" Go
" ----------
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>ii <Plug>(go-implements)
autocmd FileType go nmap <leader>re <Plug>(go-rename)
autocmd FileType go nmap <leader>ref <Plug>(go-referrers)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>d <Plug>(go-def)
autocmd FileType go nmap <leader>de <Plug>(go-describe)
autocmd FileType go nmap K <Plug>(go-doc)
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0

let g:go_autodetect_gopath = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
" let g:neomake_go_enabled_makers = ['go', 'govet']
autocmd BufLeave *.go             normal! mG

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript noremap <buffer> <leader>fmt :%!js-beautify --type js -j -q -B -f -<CR>
autocmd FileType javascript noremap <leader>r :Autoformat<CR>
autocmd FileType javascript let b:javascript_fold = 0
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript noremap <leader>d :TernDef<CR>
autocmd FileType javascript noremap <leader>ref :TernRefs<CR>
autocmd FileType javascript noremap <leader>re :TernRename<CR>
autocmd FileType javascript noremap <leader>td :TernDoc<CR>
let javascript_enable_domhtmlcss=1
" let g:neomake_javascript_enabled_makers = ['standard']
autocmd BufLeave *.js             normal! mJ
autocmd FileType javascript nmap <leader>t <Plug>(test-toggle-js)
autocmd FileType javascript noremap <leader>o :JsDoc<CR>

" Typescript
" ----------
" autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript noremap <leader>D :TSDoc<CR>
autocmd FileType typescript noremap <leader>d :TSDef<CR>
autocmd FileType typescript noremap <leader>ref :TSRefs<CR>
autocmd FileType typescript noremap <leader>t :TSType<CR>
autocmd FileType typescript noremap <leader>err :TSGetErr<CR>
autocmd FileType typescript nmap <leader>f <Plug>(test-toggle-ts)
autocmd FileType typescript noremap <leader>r :Autoformat<CR>
autocmd FileType typescript noremap <leader>o :JsDoc<CR>
let g:nvim_typescript#max_completion_detail=100
autocmd BufLeave *.ts             normal! mT
" let g:neomake_typescript_tslint_maker = {
"     \ 'args': ['%:p'],
"     \ 'errorformat': 'ERROR: %f[%l\, %c]: %m',
"     \ }
" let g:neomake_typescript_tsc_maker = {
"           \ 'args': ['--project', getcwd() . '/tsconfig.test.json', '--noEmit'],
"           \ 'append_file': 0,
"           \ 'errorformat':
"           \   '%E%f %#(%l\,%c): error %m,' .
"           \   '%E%f %#(%l\,%c): %m,' .
"           \   '%Eerror %m,' .
"           \   '%C%\s%\+%m'
"         \ }

autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

" ruby
" ----
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" php
" ---
autocmd FileType php setlocal shiftwidth=4 tabstop=8 softtabstop=4 expandtab

" Template language (SGML / XML too)
" ----------------------------------
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let html_no_rendering=1
autocmd FileType html noremap <buffer> <leader>r :%!js-beautify --type html -j -q -B -f -<CR>
autocmd BufLeave *.html             normal! mH

" CSS
" ---
autocmd FileType css,scss setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css,scss setlocal commentstring=/*\ %s\ */
autocmd FileType css,scss noremap <buffer> <leader>r :%!js-beautify --type css -j -q -B -f -<CR>
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufLeave *.css,*.less,*scss normal! mC

" Java
" ----
autocmd FileType java setlocal shiftwidth=2 tabstop=8 softtabstop=2 expandtab
autocmd FileType java setlocal commentstring=//\ %s

" rst
" ---
autocmd BufEnter *.txt setlocal spell
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 formatoptions+=nqt
" md
" ---
autocmd FileType md,markdown setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType md,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.txt setlocal ft=markdown
autocmd FileType md,markdown setlocal spell

" C/Obj-C/C++
autocmd FileType c,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab textwidth=80
autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=80
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,objc setlocal commentstring=//\ %s
autocmd FileType c,cpp noremap <buffer> <leader>r :%!astyle --mode=c --style=google -n -s2<CR>
" let g:neomake_cpp_cpplint_maker = {
"       \ 'exe': 'cpplint'
"       \ }
" let g:neomake_cpp_enabled_makers = ['cpplint']
let c_no_curly_error=1

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" JSON
" ----
autocmd FileType json setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType json noremap <buffer> <leader>r :%!js-beautify --type js -j -q -B -f -<CR>

" ------------------------------------------------------------------------ }}}
" Leader Key Mapping  ---------------------------------------------------- {{{

" Rebind <leader> key.
let g:mapleader = ','
noremap \ ,

" Open in a new tab .vimrc
nnoremap <leader>e :tabedit $MYVIMRC<CR>
" Remap visual block select.
nnoremap <leader>v <c-v>
"Open new vertical split
nnoremap <leader>vs :vsplit<CR>
" Map sort function to a key
vnoremap <leader>s :sort<CR>
" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" Reset space-tab
nnoremap <leader>reta :retab<CR>

" cd to where the file is currently located
nnoremap <leader>. :lcd %:p:h<CR>

" switch to last file edited
nnoremap <leader><leader> <c-^>

" Google search word under cursor from http://www.vimbits.com/bits/551
nnoremap <leader>is :let @p=@"<cr>yiw:!open "https://www.google.com/search?q=""<cr><cr>
    \:let @"=@p<cr>

vnoremap <leader>is y:!open "https://www.google.com/search?q=""<cr><cr>

" Google search the definition of the word under cursor
nnoremap <leader>id :let @p=@"<cr>yiw:!open "https://www.google.com/search?q=define ""<cr><cr>
    \:let @"=@p<cr>

" Easy substitution
nnoremap <leader>; :%s::cg<Left><Left><Left>
vnoremap <leader>; :s::g<Left><Left>

" redraw screen
nnoremap <leader>1 :redraw!<CR>

" use <Leader>H,J,K,L to swap windows
map <silent> <Leader>H :vertical :resize +5<CR>
map <silent> <Leader>J :resize -5<CR>
map <silent> <Leader>K :resize +5<CR>
map <silent> <Leader>L :vertical :resize -5<CR>
" ------------------------------------------------------------------------ }}}
" Plugins setup. --------------------------------------------------------- {{{
" Settings for vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#whitespace#checks = []

" Settings for neomake
" autocmd! BufWritePost * Neomake " run neomake on file write
" let g:neomake_verbose = 0
" hi NeoErrorMsg ctermfg=88
" let g:neomake_error_sign = {'text': '✘', 'texthl': 'NeoErrorMsg'}
" hi NeoWarningMsg ctermfg=136
" let g:neomake_warning_sign = {'text': '☂', 'texthl': 'NeoWarningMsg'}

" Setting for ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '☂'

" Settings for jedi-vim
let g:jedi#popup_select_first = 0

" Settings for Ack.vim
" Ack on <leader>a
nnoremap <leader>a :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ackpreview = 1

" Vimux settings
" Prompt for a command to run
nnoremap <leader>cc :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <leader>cu :VimuxRunLastCommand<CR>

" Settings for sayonara
nnoremap <silent> gs :Sayonara<CR>
nnoremap <silent> gS :Sayonara!<CR>

" Settings for ListToggle
let g:lt_quickfix_list_toggle_map = '<leader>fix'
" let g:lt_location_list_toggle_map = '<leader>l' " <- default

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" File preview using CodeRay (http://coderay.rubychan.de/) sudo gem install coderay
let g:fzf_files_options =
      \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>c        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag
nnoremap <silent> <Leader>`        :Marks<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=3
" let vim_markdown_preview_browser='Google Chrome'

let g:jsdoc_underscore_private = 1
" let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

let g:javascript_plugin_jsdoc = 1

" ------------------------------------------------------------------------ }}}
" Settings for (neocomplete and deoplete) and neosnippet ---------------------------- {{{
"
function! TabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

if has('nvim')
  " " Deoplete
  let g:deoplete#enable_at_startup = 1
  let g:echodoc_enable_at_startup=1

  let g:tern_map_keys = 0
  let g:tern_show_signature_in_pum=1
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent', '--no-port-file']

  if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
  endif
  let g:deoplete#sources#omni#input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'

  let g:deoplete#sources={}
  let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
  let g:deoplete#sources.javascript = ['ultisnips', 'ternjs', 'buffer']
  let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]

  " Insert <TAB> or select next match
  inoremap <silent> <expr> <Tab> TabComplete()

  " <C-h>, <BS>: close popup and delete backword char
  inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

  " UltiSnips settings
  let g:UltiSnipsEditSplit = 'vertical'
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/snips'
  let g:UltiSnipsSnippetDirectories = ['snips']
  let g:UltiSnipsExpandTrigger="<C-j>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  autocmd FileType javascript let g:UltiSnipsEnableSnipMate = 0
endif

" ------------------------------------------------------------------------ }}}
