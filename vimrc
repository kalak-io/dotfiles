" Gotta be the first

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'dense-analysis/neural'
Plugin 'mg979/vim-visual-multi'
Plugin 'ap/vim-css-color'
Plugin 'lifepillar/vim-solarized8'

call vundle#end()

filetype plugin indent on

" ----- General settings -----
" Encoding
set fileformat=unix
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8


" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set autoindent
" execute ":silent tab all"

" Fix backspace indent
set backspace=indent,eol,start

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set matchtime=3

" Directories for swp files
set nobackup
set noswapfile
set nowb

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set updatetime=1000

" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter * set timeout
au InsertLeave * set notimeout

" Persistant undo
set undodir=~/.vim/undodir
set undofile

" Enable hidden buffers
set hidden

" History
set history=100

" Faster refraw
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Better command-line completion
set wildmenu

" ----- Visual settings -----
syntax enable

set number
set nowrap
set cursorline

set clipboard=unnamedplus
set mouse=a

set showcmd
set shortmess+=I " No intro when starting Vim
set virtualedit=onemore " Allow the cursor to move just past the end of the line

" Theme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized8
let g:solarized_termcolors=256

" Scroll
set scrolloff=10 " Always keep 10 lines after or before when scrolling
set sidescrolloff=5 " Always keep 5 lines after or before when side scrolling

" Splits
set splitbelow
set splitright

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

" ----- Mappings -----
function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingEscInInsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction

" Usefull shortcuts to enter insert mode
nnoremap <CR> i<CR>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>

" Home - Go To Begin
call CreateShortcut("Home", "gg", "inv")

" End - Go To End
call CreateShortcut("End", "G", "inv")

"Ctrl C - Close current tab
call CreateShortcut("C-c", ":tabclose<CR>", "inv")

" Ctrl F - Find
call CreateShortcut("C-f", "/", "in", "noTrailingIInInsert")

" Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")

" Ctrl Q - Quit
call CreateShortcut("C-q", ":qa!<CR>", "inv", "cmdInVisual")

" Ctrl R - Redo
call CreateShortcut("C-r", "<C-r>", "in")

" Ctrl S - Save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
vnoremap <c-s> <Esc>:w<CR>

" Ctrl T - New tab
call CreateShortcut("C-t", ":tabnew<CR>i", "inv", "noTrailingIInInsert", "cmdInVisual")

" Ctrl Z - Undo
call CreateShortcut("C-z", "u", "in")

" Pageup - Move up Line
call CreateShortcut("PageUp", ":m-2<CR>", "inv", "restoreSelectionAfter")

" Pagedown - Move down Line
call CreateShortcut("PageDown", ":m+<CR>", "in")
call CreateShortcut("PageDown", ":m'>+<CR>", "v", "restoreSelectionAfter")

" Ctrl Right - Next tab
call CreateShortcut("C-Right", "gt", "inv")

" Ctrl Left - Previous tab
call CreateShortcut("C-Left", "gT", "inv")


" j=Down
" k=Up
" l=Left
" ;=Right
nnoremap l h
vnoremap l h
nnoremap ; l
vnoremap ; l

" ----- Abbreviations -----
imap cll console.log()<Esc>==f(a

" ----- Plugins settings -----
" NERDTree
nnoremap <C-n> :NERDTreeFocusToggle<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open file in new tab
let NERDTreeMapOpenInTab = '<ENTER>'
" Add icons in NERDTree
set guifont=DroidSansMono\ Nerd\ Font\ 11

let g:nerdtree_tabs_open_on_console_startup=0

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode="passive"
augroup END

" ----- CtrlP settings -----
let g:ctrlp_working_path_mode = 'ra' " search in local working directory according .git dir or file
let g:ctrlp_switch_buffer = 'et' " open in a new tab
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignore files in gitignore
" Ignore some files or directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1

" ----- Ale settings -----
" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'python': ['flake8', 'black'],
\}
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
\   'vue': ['eslint', 'vls']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" ----- Neural settings -----
let g:neural = {
\   'source': {
\       'openai': {
\           'api_key': $OPENAI_API_KEY,
\       },
\   },
\}

" ----- Visual Multi -----
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
