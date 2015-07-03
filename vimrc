"  Alex's vimrc
"{{{
" Set up vim-plug
let s:vim_plugger = expand('$HOME/.vim/autoload/plug.vim')
if filewritable(s:vim_plugger) == 0
	!curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Touch untracked config files
let colourme=1
let colour_vim=expand('~/.vim/colours.vim')
if !filereadable(colour_vim)
	echo "Creating colour file - declare colorscheme in colours.vim"
	echo ""
	silent !echo 'colorscheme luna-term' > ~/.vim/colours.vim
	let colourme=0
endif
"}}}

"  Plugins go here:
"{{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-tags'
Plug 'Pychimp/vim-luna'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lilydjwg/colorizer'
Plug 'mhinz/vim-startify'
Plug 'ajpaulson/notes.vim'
Plug 'molok/vim-smartusline'
call plug#end()
"}}}

"  END BUNDLES / START MAIN RC
"{{{
runtime macros/matchit.vim " enable matchit

"  Basic Settings
let mapleader="," " change the leader to be a comma vs slash
set number " Display line numbers
set relativenumber
set numberwidth=1 " using only 1 column (and 1 space) while possible
source ~/.vim/colours.vim
source ~/.vim/statusline.vim
source ~/.vim/ScratchEdit.vim
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>
set wildignore+=*.o,*.obj,.git,*.pyc " Ignore these files when completing
set modeline " Debian sets modeline off
set completeopt=menuone,longest,preview " don't select first item, follow typing in autocomplete
set pumheight=6 " Keep a small completion window
set omnifunc=syntaxcomplete#Complete
set grepprg=ack-grep " replace the default grep program with ack
set splitbelow
set splitright
set ls=2 " Always show status line ('laststatus')
set vb t_vb= " Disable all bells. I hate ringing/flashing.
set confirm " Y-N-C prompt if closing with unsaved changes.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler " Show some info, even without statuslines.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,5c5V\ %P%) " a ruler on steroids
set listchars=tab:>-,eol:¶,trail:≖,precedes:<,extends:> " Easily see tabs, spaces, end of line etc.
set list
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex
set tildeop " Tilde command acts like an operator
" Pane independent search
augroup last_search
	autocmd!
	autocmd WinLeave * let w:last_search = @/
	autocmd WinEnter * if exists('w:last_search') | let @/ = w:last_search | endif
augroup END
set noswapfile " Turn off swap files
set nowb "no writebackup
"keep undo history across sessions by storing in file
let s:vim_cache = expand('$HOME/.vim/backups')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
	call mkdir(s:vim_cache, "p", 0700)
endif
set undodir=~/.vim/backups
set undofile
set cursorline " have a line indicate the cursor location
set cursorcolumn " have a column to indicate the cursor location
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=5 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set matchtime=2 " (for only .2 seconds).
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set matchpairs+=<:> " show matching <> (html mainly) as well
set cinoptions=:0,g0,(0,Ws,l1 " Set a few indentation parameters.
set smarttab " Add and delete spaces in increments of 'shiftwidth' for tabs
set switchbuf=useopen,usetab
map <leader>q :tabclose<cr>
map gp :tabprevious<cr>
" ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too
imap <c-j> <c-o><c-w>j
imap <c-k> <c-o><c-w>k
imap <c-l> <c-o><c-w>l
imap <c-h> <c-o><c-w>h

set clipboard=unnamed,unnamedplus " Anonymous register uses system clipboard
noremap x "_x
vnoremap p "_c<Esc>P
" show a line at column 80
if exists("&colorcolumn")
	set colorcolumn=80
endif

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :tabe ~/.vim/vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vim/vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Spell Check (f for fuckup)
map <silent> <leader>f :set spell!<CR>
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
"Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=' '<CR>
"Use pandoc to create a pdf of current file
nnoremap <Leader>p :!pandoc % -s -o %:r.pdf<CR>

"""" Reading/Writing
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.
autocmd BufWritePre * set ff=unix
" Prevent vim from setting filetype to `plaintex`
let g:tex_flavor='latex'

" Tabline colours
hi TabLineFill ctermfg=23 ctermbg=231
hi Tabline cterm=NONE ctermfg=231 ctermbg=23
hi TablineSel cterm=NONE ctermfg=0 ctermbg=149

set t_Co=256 " Some terminals *REALLY* need this
"}}}

"  Plugin Configurations
"{{{
let g:smartusline_string_to_highlight = '[%t]'

" Quick open startify
map <leader>s :Startify<CR>

" Syntastic rules
let g:syntastic_c_checkers = [ 'clang' ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_compiler = 'clang'
let g:syntastic_sh_checkers=[ "bashate" ]

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Fugitive - go to repo root
nnoremap <leader>/ :Glcd<CR>

" Map TagBar toggle to F8
nmap <F8> :TagbarToggle<CR>

"Rainbow Parentheses Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" NeoComplete and NeoSnippets
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#fallback_mappings =
	\ ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#complete_common_string()
" Tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" NeoSnippet mappings (^k to expand a selected snippet)
imap <C-k>    <Plug>(neosnippet_expand_or_jump)
smap <C-k>    <Plug>(neosnippet_expand_or_jump)
xmap <C-k>    <Plug>(neosnippet_expand_target)
" SuperTab like NeoSnippet mappings (tab to jump to next field)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"
" For snippet complete marker
if has('conceal')
	set conceallevel=2 concealcursor=inv
endif
" Use Honza's snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = { '-' : 1, }
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c =
			\ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp =
			\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Hack to disable colorcolumn for startify
autocmd FileType startify setlocal colorcolumn&
let g:startify_files_number = 3
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 1
let g:startify_list_order = [
			\ ['    My Sessions'],
			\ 'sessions',
			\ ['    Recently Edited Here'],
			\ 'dir',
			\ ['    Recently Edited'],
			\ 'files',
			\ ['    My Bookmarks'],
			\ 'bookmarks',
			\ ]
let g:startify_skiplist = [
			\ '.git/',
			\ $VIMRUNTIME .'/doc',
			\ 'bundle/.*/doc',
			\ 'plugged/.*/doc',
			\ '^/tmp',
			\ '.*history',
			\ '.*lock',
			\ '.news_time',
			\ '.viminfo',
			\ '.zcompdump*',
			\ '.*session-errors*',
			\]

source ~/.vim/headers/watcher.vim
"}}}
" vim:ft=vim:fdm=marker
