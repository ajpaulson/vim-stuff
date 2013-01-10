"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Alex's vimrc                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible        " be iMproved
filetype off            " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

""""""""""""""""""""""
"  Bundles go here:  "
""""""""""""""""""""""

" Powerline for Vim
Bundle 'Lokaltog/vim-powerline'

Bundle 'vim-scripts/The-NERD-tree.git'
" NERD tree file manager

Bundle 'mutewinter/nginx.vim.git'
" Nginx syntax highlighting and filetype detection

Bundle 'gmarik/github-search.vim'
" Github Search. To use: :GHSearchRepo <example> [pressing 'c' clones to 
" ~/src/github_user/github_repo]

Bundle 'sjl/gundo.vim.git'
" Visual Undo in vim with diff

Bundle 'tpope/vim-fugitive.git'
" Interface with git from vim

Bundle 'tpope/vim-git.git'
" Syntax highlighting for git config files

Bundle 'fholgado/minibufexpl.vim.git'
" Visually display what buffers are currently opened

Bundle 'tpope/vim-surround.git'
" Allows you to surround text with open/close tags

Bundle 'mileszs/ack.vim.git'
" Searching and junk

Bundle 'ervandew/supertab.git'
" SuperTab

Bundle 'mattn/zencoding-vim.git'
" big ass template snippets etc

Bundle 'Rip-Rip/clang_complete.git'
" Autocomplete C using Clang

Bundle 'SirVer/ultisnips'
" The best snippet plugin around

Bundle 'vim-scripts/mail.vim'
" Mail syntax highlighting

Bundle 'tyru/open-browser.vim'
" Open URI from vim

Bundle 'mattn/webapi-vim'
" vim interface to Web-API

Bundle 'basyura/twibill.vim'
" Twitter API wrapper

Bundle 'basyura/bitly.vim'
" Vimscript utility for bit.ly

Bundle 'Shougo/unite.vim'
" Ultimate interface to unite all sources

Bundle 'h1mesuke/unite-outline'
" Outline source for unit.vim

Bundle 'basyura/TweetVim'
" Twitter client for vim

Bundle 'tomasr/molokai.git'
" Molokai colour scheme

Bundle 'majutsushi/tagbar'
" Display tags of source code

Bundle 'groenewege/vim-less'
" LESS Stylesheet syntax, indent, and autocomplete

Bundle 'voithos/vim-multiselect'
" Multiselection in visual mode

Bundle 'vim-scripts/genutils'
" General utility functions

Bundle 'Townk/vim-autoclose'
" Automatically closes parens

Bundle 'scrooloose/syntastic'
" Syntax checking hacks

Bundle 'myusuf3/numbers.vim'
" switches number display type when you switch mode

Bundle 'Lokaltog/vim-distinguished'
" Distinguished colour scheme

Bundle 'sickill/vim-monokai'
" Monokai

Bundle 'baskerville/bubblegum'
" Bubblegum colour scheme

Bundle 'chrisbra/csv.vim'
" awesome stuff to deal with csv files

Bundle 'rhysd/open-pdf.vim'
" open pdfs nice and easy like

"""""""""""""""""""""""""""""""""
"  END BUNDLES / START MAIN RC  "
"""""""""""""""""""""""""""""""""

filetype plugin indent on   " required!

let mapleader="," " change the leader to be a comma vs slash

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

"Spell Check
map <c-t> :w!<CR>: !aspell check %<CR>: e! %<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" .less to .css, lessc is required
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" keystroke to toggle numbers.vim plugin
nnoremap <F3> :NumbersToggle<CR>

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set grepprg=ack-grep " replace the default grep program with ack

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

set complete+=.
set complete+=k
set complete+=b
set complete+=t
set complete+=w
set complete+=u

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6 " Keep a small completion window
au FileType python set omnifunc=pythoncomplete#Complete
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" Use tab to scroll through autocomplete menus
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:SuperTabCrMapping = 0

" Prevent vim from setting filetype to `plaintex`
let g:tex_flavor='latex'

" Set options for zencoding
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_comlete_tag = 1

" Set options for open-pdf
let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Map TagBar toggle to F8
nmap <F8> :TagbarToggle<CR>

map <leader>f :bn<CR>
map <leader>r :bp<CR>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on " syntax highlighing
filetype plugin indent on " enable loading indent file for filetype
set number " Display line numbers
set backspace=indent,eol,start "Allow Backspace in insert mode"
set numberwidth=1 " using only 1 column (and 1 space) while possible
colorscheme molokai
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=full " <Tab> cycles between all matching choices.
set t_Co=256
set timeoutlen=400
set ttimeoutlen=500

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif
"
"     """ Moving Around/Editing
set cursorline " have a line indicate the cursor location
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set matchtime=2 " (for only .2 seconds).
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
set foldcolumn=1 " show the fold column
set encoding=utf-8

"""" Reading/Writing
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set noautoread " Don't automatically re-read changed files.
set modeline " Allow vim options to be embedded in files;
set modelines=5 " they must be within the first or last 5 lines.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.
autocmd BufWritePre * set ff=unix

"""" Messages, Info, Status
set ls=2 " allways show status line
set vb t_vb= " Disable all bells. I hate ringing/flashing.
set confirm " Y-N-C prompt if closing with unsaved changes.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler " Show some info, even without statuslines.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,5c5V\ %P%) " a ruler on steroids
set laststatus=2 " Always show statusline, even if only 1 window.
set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:¶,trail:➤,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex

"Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=' '<CR>
