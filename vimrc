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
Bundle 'scrooloose/nerdtree'
" NERD tree file manager

Bundle 'jistr/vim-nerdtree-tabs'
" Have NerdTree in all tabs

Bundle 'gmarik/github-search.vim'
" Github Search. To use: :GHSearchRepo <example> [pressing 'c' clones to 
" ~/src/github_user/github_repo]

Bundle 'sjl/gundo.vim.git'
" Visual Undo in vim with diff

Bundle 'tpope/vim-fugitive.git'
" Interface with git from vim

Bundle 'tpope/vim-git.git'
" Syntax highlighting for git config files

Bundle 'tpope/vim-surround.git'
" Allows you to surround text with open/close tags

Bundle 'mileszs/ack.vim.git'
" Searching and junk

Bundle 'ervandew/supertab.git'
" SuperTab

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

Bundle 'Shougo/vimproc.vim'
"needed to make Unite stuff work

Bundle 'h1mesuke/unite-outline'
" Outline source for unit.vim

Bundle 'majutsushi/tagbar'
" Display tags of source code

Bundle 'vim-scripts/genutils'
" General utility functions

Bundle 'scrooloose/syntastic'
" Syntax checking hacks

Bundle 'myusuf3/numbers.vim'
" switches number display type when you switch mode

Bundle 'flazz/vim-colorschemes'
" a big load of colourschemes

Bundle 'xuhdev/SingleCompile'
" more convenient compilation and execution of single source files

Bundle 'lilydjwg/colorizer'
" highlight colors as themselves

Bundle 'jamessan/vim-gnupg'
" transparent and secure editing of gpg encrypted files

Bundle 'tpope/vim-sleuth'
" Heuristically set buffer options

Bundle 'tpope/vim-unimpaired'
" pairs of handy bracket matchings

Bundle 'tpope/vim-eunuch'
" helpers for Unix

Bundle 'scrooloose/nerdcommenter'
" Intensely orgasmic commenting

Bundle 'vim-scripts/std_c.zip'
" Extra Standard C syntax

Bundle 'nathanaelkane/vim-indent-guides'
" Some pretty swish indent guides

Bundle 'tpope/vim-abolish'
" Search, Substitute, and Abbreviate multiple variants of a word

Bundle 'mhinz/vim-startify'
" Start screen for Vim

Bundle 'szw/vim-tags'
" Ctags generator for vim

Bundle 'ajpaulson/taboo.vim'
" so I can rename tabs

Bundle 'Greduan/vim-usefulstatusline'

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
map <leader>n :NERDTreeTabsToggle<CR>

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

" Improve register use
" Don't update default register when deleting single characters
noremap x "_x
" Don't update default register when pasting in visual mode
vnoremap p "_c<Esc>P

map <leader>q :tabclose<cr>
map gp :tabprevious<cr>

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

"""""""""""""""""
"  Unite stuff  "
"""""""""""""""""

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-r> Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-r> Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <leader>r :<C-r> Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>o :<C-r> Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-r> Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-r> Unite -no-split -buffer-name=buffer buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with Ctrl-j and Ctrl-k in insert mode
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" Space / does some grepping
nnoremap <space>/ :Unite grep:.<cr>

"""""""""""""""""""""""""""
"  Plugin Configurations  "
"""""""""""""""""""""""""""

let g:SuperTabCrMapping = 0
let g:SuperTabMappingBackward = '<c-tab>' " This is won't work in console but I wanted to free up Shift+Tab for literal tab which I actually use.
let g:SuperTabMappingLiteral = '<s-tab>'

" Prevent vim from setting filetype to `plaintex`
let g:tex_flavor='latex'

" Set options for clang complete
let g:clang_use_library = 1

" Set options for indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Set options for Taboo
let g:taboo_tab_format = "%N[%f]%m"
let g:taboo_renamed_tab_format = "%N[%f]%m"
" Map TagBar toggle to F8
nmap <F8> :TagbarToggle<CR>

" SingleCompile mappings
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Colour highlight mapping
nmap <F4> :ColorToggle<cr>

" use either silver-surfer or ack-grep for Unite Grep
      if executable('ag')
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
        let g:unite_source_grep_recursive_opt=''
      elseif executable('ack')
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a'
        let g:unite_source_grep_recursive_opt=''
      endif

let g:unite_source_history_yank_enable = 1

" Tabline colours
hi TabLineFill ctermfg=244 ctermbg=236
hi Tabline ctermfg=244 ctermbg=236
hi TablineSel ctermfg=22 ctermbg=148

" Tab navigation in with alt-#
map <leader>1 :tabnext 1<CR>
map <leader>2 :tabnext 2<CR>
map <leader>3 :tabnext 3<CR>
map <leader>4 :tabnext 4<CR>
map <leader>5 :tabnext 5<CR>
map <leader>6 :tabnext 6<CR>
map <leader>7 :tabnext 7<CR>
map <leader>8 :tabnext 8<CR>
map <leader>9 :tabnext 9<CR>
map <leader>0 :tabnext 0<CR>
