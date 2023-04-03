" Gotta be the first

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/syntastic'
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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()

filetype plugin indent on

" ----- General settings -----
" Encoding
set fileformat=unix

" Indentation options
set autoindent
set expandtab
set shiftround
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
" execute ":silent tab all"

" Miscellaneous options
" Fix backspace indent
set backspace=indent,eol,start
set autoread
set confirm

" Directories for swap files
set nobackup
set noswapfile
set nowb

" Enable hidden buffers
set hidden

" History
set history=100

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set matchtime=3

" Performance options
set complete-=i
set lazyredraw
" Faster refraw
set ttyfast

" Text Rendering options
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8
set scrolloff=10 " Always keep 10 lines after or before when scrolling
set sidescrolloff=5 " Always keep 5 lines after or before when side scrolling
syntax enable

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

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Better command-line completion
set wildmenu

set spell

" Preserve indentation when paste code
set pastetoggle=<F2>

" ----- Visual settings -----
set number
set relativenumber
set ruler
set nowrap
set cursorline

set laststatus=2

set clipboard=unnamedplus
set mouse=a

set showcmd
set shortmess+=I " No intro when starting Vim
set virtualedit=onemore " Allow the cursor to move just past the end of the line

" Fold based on indention levels.
set foldmethod=indent
" Only fold up to three nested levels.
set foldnestmax=3
" Disable folding by default.
set nofoldenable

" Theme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized8
let g:solarized_termcolors=256

" Splits
set splitbelow
set splitright

" Ignore some files or directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

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

" " Home - Go To Begin of file
" call CreateShortcut("Home", "gg", "inv")
"
" " End - Go To End of file
" call CreateShortcut("End", "G", "inv")

" Ctrl A - Go To Begin of line
call CreateShortcut("C-a", "0", "i")
call CreateShortcut("C-a", "0i", "nv")

" Ctrl C - Close current tab
call CreateShortcut("C-c", ":tabclose<CR>", "inv")

" Ctrl D - Multi visual edit

" Ctrl E - open/close NERDTree
call CreateShortcut("C-e", ":NERDTreeToggle<CR>", "inv")

" Ctrl F - Find
call CreateShortcut("C-f", "/", "in", "noTrailingIInInsert")

" Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")

" Ctrl L - Delete all lines
call CreateShortcut("C-l", "ggdG", "in")

" Ctrl G - Search content in files
call CreateShortcut("C-g", ":Ag ", "inv")

" Ctrl P - Search a file
call CreateShortcut("C-p", ":Files .<CR>", "inv")

" Ctrl Q - Quit
call CreateShortcut("C-q", ":qa!<CR>", "inv", "cmdInVisual")

" Ctrl R - Redo
call CreateShortcut("C-r", "<C-r>", "in")

" Ctrl S - Save
call CreateShortcut("C-s", ":w<CR>", "inv")

" Ctrl T - New tab
call CreateShortcut("C-t", ":tabnew<CR>i", "inv", "noTrailingIInInsert", "cmdInVisual")

" Ctrl X - Open a terminal
call CreateShortcut('C-x', ":term<CR>", "inv")

" Ctrl Z - Undo
call CreateShortcut("C-z", "u", "in")

" Pageup - Move up Line
call CreateShortcut("PageUp", ":m-2<CR>", "inv", "restoreSelectionAfter")

" Pagedown - Move down Line
call CreateShortcut("PageDown", ":m+<CR>", "in")
call CreateShortcut("PageDown", ":m'>+<CR>", "v", "restoreSelectionAfter")

" Ctrl Left - Go To Begin of line
call CreateShortcut("C-Left", "0", "i")
call CreateShortcut("C-Left", "0i", "nv")

" Ctrl Right - Go To End of line
call CreateShortcut("C-Right", "$l", "i")
call CreateShortcut("C-Right", "$li", "nv")

" Alt Left - Previous tab
call CreateShortcut("A-Left", "gT", "inv")

" Alt Right - Next tab
call CreateShortcut("A-Right", "gt", "inv")

" Remap h-j-k-l to j-k-l-;
nnoremap l h
vnoremap l h
nnoremap ; l
vnoremap ; l

" ----- Abbreviations -----
imap cll console.log()<Esc>==f(a

" ----- Plugins settings -----
" NERDTree
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

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='solarized'

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
\   'python': ['black', 'pycln'],
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

" ----- Visual Multi settings -----
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

" ----- FZF settings -----
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
