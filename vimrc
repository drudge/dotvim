scriptencoding utf-8

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

"" default to insert mode for most code files
"au BufWinEnter * set noinsertmode
"au BufWinEnter .vimrc,*.php,*.js,*.inc,*.jade,*.c,*.ejs,*.css,*.html,*.htm set insertmode | imap <buffer> <Esc> <C-l>

" put backups and swap files somewhere out of the way
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp,~/tmp,/var/tmp,/tmp
set swapfile " do want
set backup   " do want

" persist undo across launches, vim 7.3+
if has('persistent_undo')
    set undodir=~/.tmp,~/tmp,/var/tmp,/tmp
    set undofile
endif

set encoding=utf-8
set number
set numberwidth=4
set nocp    " we use vim, not vi
set modelines=0 " practice safe vimming
set nomodeline
set foldenable
set laststatus=2 " always show the status line
set cmdheight=2
set cursorline " highlight current linefiletype indent off
set showcmd
set showfulltag
set shortmess+=ts
set wildmenu " turn on command line completion wild style
set wildmode=list:longest " turn on wild mode huge list
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set mouse=a
set iskeyword+=_,$,@,%,# " none of these are word dividers
set nostartofline
set novisualbell
set showmatch
set expandtab
set ignorecase
set infercase
set shiftround
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=8
set ruler
set backspace=eol,start,indent " backspace crosses newlines?
set clipboard=unnamed
set scrolloff=4
set hlsearch
set incsearch
let mapleader=','
set smarttab " tabs to indent, spaces to align
set updatetime=1000
set whichwrap+=<>[]
set display=lastline " show as much of the last line as possible
set showmatch
set matchtime=2
set timeout timeoutlen=3000 ttimeoutlen=100 " adjust map/key timeouts
"set hidden " allow hidden buffers, rather than closing
set foldmethod=syntax
set foldlevelstart=99
set autoread " automatically reload files changed outside Vim
set autowrite " automatically write files when doing things like :make
set modelines=5

if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" open help on bottom
cnoreabbrev h bot h

"set completeopt= " don't use a pop up menu for completions
filetype plugin indent on " load filetype plugins/indent settings

syntax on " syntax highlighting on

let g:acp_behaviorSnipmateLength='1'

" taglist stuff
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Auto_Open='1'
let Tlist_File_Fold_Auto_Close='1'
let Tlist_Enable_Fold_Column='0'
let Tlist_Exit_OnlyWindow='1'
let Tlist_Compact_Format='1'
let Tlist_Process_File_Always='1'
let Tlist_Show_Menu='1'
"let Tlist_GainFocus_On_ToggleOpen='1'
au BufEnter __Tag_List__ :setlocal statusline=Tag\ List

" Conque stuff
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_InsertOnEnter = 0

autocmd FileType python set omnifunc=pythoncomplete#Complete 
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
autocmd FileType c set omnifunc=ccomplete#Complete 

set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor 
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch) 
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the 
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line 
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match 
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current 
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in 
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

if has("gui_running")
    set guioptions=egmrt
    colorscheme sidetracked
    
    if has("mac")
        set guifont=Menlo:h11
    endif
endif

" nicer looking tabs and whitespace
if (&termencoding == "utf-8") || has("gui_running")
    if v:version >= 700
        set listchars=tab:»·,trail:·,extends:…,eol:¶
        "let &showbreak=nr2char(8618).'   '
        "let &showbreak='->  '
    else
        set listchars=tab:»·,trail:·,extends:…,eol:¶
    endif
endif
set cpoptions+=$

" Syntax customizations
let is_posix=1
let c_gnu=1
let c_space_errors=1
let c_curly_error=0
let c_no_bracket_error=1
let objc_syntax_for_h=1
let filetype_m='objc'
set cinoptions=g1,h3,t0,(0,W4

" CommandT
let g:CommandTMaxHeight=30


