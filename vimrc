"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Alex's vimrc                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible        " be iMproved
filetype off            " required!

" Setting up Vundle - the vim plugin bundler
" shamelessly nicke from github.com/fisadev
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

""""""""""""""""""""""
"  Bundles go here:  "
""""""""""""""""""""""

" Powerline for Vim
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'scrooloose/nerdtree'
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

Bundle 'vim-scripts/bufexplorer.zip'
" Buffer explorer/browser

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

Bundle 'Shougo/unite.vim'
" Ultimate interface to unite all sources

Bundle 'h1mesuke/unite-outline'
" Outline source for unit.vim

Bundle 'majutsushi/tagbar'
" Display tags of source code

Bundle 'groenewege/vim-less'
" LESS Stylesheet syntax, indent, and autocomplete

Bundle 'vim-scripts/genutils'
" General utility functions

Bundle 'scrooloose/syntastic'
" Syntax checking hacks

Bundle 'myusuf3/numbers.vim'
" switches number display type when you switch mode

Bundle 'flazz/vim-colorschemes'
" a big load of colourschemes

Bundle 'chrisbra/csv.vim'
" awesome stuff to deal with csv files

Bundle 'rhysd/open-pdf.vim'
" open pdfs nice and easy like

Bundle 'xuhdev/SingleCompile'
" more convenient compilation and execution of single source files

Bundle 'lilydjwg/colorizer'
" highlight colors as themselves

Bundle 'jamessan/vim-gnupg'
" transparent and secure editing of gpg encrypted files

Bundle 'tpope/vim-markdown'
" Markdown runtime files

Bundle 'tpope/vim-sleuth'
" Heuristically set buffer options

Bundle 'tpope/vim-unimpaired'
" pairs of handy bracket matchings

Bundle 'tpope/vim-eunuch'
" helpers for Unix

Bundle 'scrooloose/nerdcommenter'
" Intensely orgasmic commenting

Bundle 'ajpaulson/vim-tabs'
" Make vim's tabbar more useable

Bundle 'godlygeek/tabular'
" Text alignment helper (dependency for tablemode)

Bundle 'dhruvasagar/vim-table-mode'
" Instant table creation (<leader>tm to toggle)

Bundle 'vim-scripts/std_c.zip'
" Extra Standard C syntax

Bundle 'nathanaelkane/vim-indent-guides'
" Some pretty swish indent guides

Bundle 'tpope/vim-abolish'
" Search, Substitute, and Abbreviate multiple variants of a word

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
let g:SuperTabMappingBackward = '<c-tab>' " This is won't work in console but I wanted to free up Shift+Tab for literal tab which I actually use.
let g:SuperTabMappingLiteral = '<s-tab>'

" Prevent vim from setting filetype to `plaintex`
let g:tex_flavor='latex'

" Set options for zencoding
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_comlete_tag = 1

" Set options for clang complete
let g:clang_use_library = 1

" Set options for open-pdf
let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

" Set options for indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Map TagBar toggle to F8
nmap <F8> :TagbarToggle<CR>

map <leader>f :bn<CR>
map <leader>r :bp<CR>

" SingleCompile mappings
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Colour highlight mapping
nmap <F4> :ColorToggle<cr>

map <leader>t :tabnew<cr>
map <leader>q :tabclose<cr>
map gp :tabprevious<cr>

" Improve register use
" Don't update default register when deleting single characters
noremap x "_x
" Don't update default register when pasting in visual mode
vnoremap p "_c<Esc>P

" ==========================================================
" Basic Settings
" ==========================================================
syntax on " syntax highlighing
filetype plugin indent on " enable loading indent file for filetype
set number " Display line numbers
set backspace=indent,eol,start "Allow Backspace in insert mode"
set numberwidth=1 " using only 1 column (and 1 space) while possible
source ~/.vim/colours.vim
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=full " <Tab> cycles between all matching choices.
set t_Co=256
set pastetoggle=<F2>
" Turn off swap files
set noswapfile
set nobackup
set nowb
"keep undo history across sessions by storing in file
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
" Anonymous register uses system clipboard
set clipboard=unnamedplus

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" set a faster switch from insert to normal mode for powerline
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
"
"     """ Moving Around/Editing
set cursorline " have a line indicate the cursor location
set cursorcolumn " have a column to indicate the cursor location
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set matchtime=2 " (for only .2 seconds).
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set shiftround " rounds indent to a multiple of shiftwidth
set matchpairs+=<:> " show matching <> (html mainly) as well
"set foldmethod=indent " allow us to fold on indents
"set foldlevel=99 " don't fold by default
"set foldcolumn=1 " show the fold column
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
"set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}
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

""" easier navigation of tabs
""" :sb <tab-complete name of file open in other tab>
set switchbuf=useopen,usetab

"Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=' '<CR>
