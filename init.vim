"  Alex's nvimrc
"{{{
" Set up vim-plug
let s:vim_plugger = expand('$HOME/.config/nvim/autoload/plug.vim')
if filewritable(s:vim_plugger) == 0
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Touch untracked config files
let colourme=1
let colour_vim=expand('~/.config/nvim/colours.vim')
if !filereadable(colour_vim)
	echo "Creating colour file - declare colorscheme in colours.vim"
	echo ""
	silent !echo 'colorscheme luna-term' > ~/.config/nvim/colours.vim
	let colourme=0
endif
"}}}

"  Plugins go here:
"{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-tags'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'lilydjwg/colorizer'
Plug 'mhinz/vim-startify'
Plug 'molok/vim-smartusline'
call plug#end()
"}}}

"  END BUNDLES / START MAIN RC
"{{{
"  Basic Settings
let mapleader="," " change the leader to be a comma vs slash
set number " Display line numbers
set relativenumber
set numberwidth=1 " using only 1 column (and 1 space) while possible
source ~/.config/nvim/colours.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/ScratchEdit.vim
set title " show title in console title bar
set wildignore+=*.o,*.obj,.git,*.pyc " Ignore these files when completing
set completeopt=menuone,longest,preview " don't select first item, follow typing in autocomplete
set pumheight=6 " Keep a small completion window
set omnifunc=syntaxcomplete#Complete
set grepprg=ack-grep " replace the default grep program with ack
set splitbelow
set splitright
set vb t_vb= " Disable all bells. I hate ringing/flashing.
set confirm " Y-N-C prompt if closing with unsaved changes.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler " Show some info, even without statuslines.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,5c5V\ %P%) " a ruler on steroids
set listchars=tab:▸\ ,eol:¶,trail:·,precedes:«,extends:» " Easily see tabs, spaces, end of line etc.
set list
au TermOpen * setlocal nolist nocursorline nocursorcolumn " Clean up for :terminal
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
" Pane independent search
augroup last_search
	autocmd!
	autocmd WinLeave * let w:last_search = @/
	autocmd WinEnter * if exists('w:last_search') | let @/ = w:last_search | endif
augroup END
set noswapfile " Turn off swap files
set nowb "no writebackup
"keep undo history across sessions by storing in file
let s:vim_cache = expand('$HOME/.config/nvim/backups')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
	call mkdir(s:vim_cache, "p", 0700)
endif
set undodir=~/.config/nvim/backups
set undofile
set cursorline " have a line indicate the cursor location
set cursorcolumn " have a column to indicate the cursor location
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=5 " Keep 3 context lines above and below the cursor
set showmatch " Briefly jump to a paren once it's balanced
set matchtime=2 " (for only .2 seconds).
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set matchpairs+=<:> " show matching <> (html mainly) as well
set cinoptions=:0,g0,(0,Ws,l1 " Set a few indentation parameters.
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
" Use ctrl-g in insert mode to input digraphs
inoremap <c-g> <c-k>

set clipboard+=unnamedplus "Neovim uses xclip or xsel
noremap x "_x
vnoremap p "_c<Esc>P
" show a line at column 80
set colorcolumn=80

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

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

set t_Co=256 " Some terminals *REALLY* need this
"}}}

"  Plugin Configurations
"{{{
let g:smartusline_string_to_highlight = '[%t]'

" Quick open startify
map <leader>s :Startify<CR>

" Syntastic rules
let g:syntastic_c_checkers = [ 'clang_check' ]
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

"Rainbow Parentheses
au VimEnter * RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = [233, 234]

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
autocmd InsertLeave * NeoSnippetClearMarkers

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
" <TAB> completion
imap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#mappings#manual_complete()
function! s:check_back_space()
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

" Open Plug window bottom, horizontal
let g:plug_window='botright new'

" Hack to disable colorcolumn for startify
autocmd FileType startify setlocal colorcolumn&
let g:startify_files_number = 3
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.config/nvim/sessions'
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
			\ '.nviminfo',
			\ '.zcompdump*',
			\ '.*session-errors*',
			\ '.nvim*',
			\]

source ~/.config/nvim/headers/kraken.vim
"}}}
" vim:ft=vim:fdm=marker
