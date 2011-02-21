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
set backupcopy=yes 

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
set hidden " allow hidden buffers, rather than closing
set foldmethod=syntax
set foldlevelstart=99
set autoread " automatically reload files changed outside Vim
set autowrite " automatically write files when doing things like :make
set modelines=5
set switchbuf=usetab
set noequalalways

set diffopt+=vertical

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

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:PreviewBrowsers='Safari'

" taglist stuff
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Auto_Open='1'
let Tlist_Use_Right_Window='1'
let Tlist_Show_One_File='1'
let Tlist_File_Fold_Auto_Close='1'
let Tlist_Enable_Fold_Column='0'
let Tlist_Exit_OnlyWindow='1'
let Tlist_Compact_Format='1'
let Tlist_Process_File_Always='1'
let Tlist_Show_Menu='1'
let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;f:function;d:require'

"autocmd BufWritePost * :TlistUpdate

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

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%{fugitive#statusline()}
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
        set guifont=Consolas:h12
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

let NERDShutUp=1 " no more f*cking 'unknown filetype' warnings!
" NERDTree configuration
let NERDTreeIgnore=['\.sock$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Project Tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateSidebars()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function s:UpdateSidebars()
    call s:UpdateNERDTree()
    TlistUpdate
endfunction

 Project Tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . fnameescape(a:dir)
  let stay = exists("a:1") ? a:1 : 1

  NERDTree

  if !stay
    wincmd p
  endif
endfunction

function Touch(file)
  execute "!touch " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . shellescape(a:file, 1)
  endif

  call s:UpdateNERDTree()
endfunction

function Mkdir(file)
  execute "!mkdir " . shellescape(a:file, 1)
  call s:UpdateNERDTree()
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . fnameescape(a:file)

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")
call s:DefineCommand("e", "Edit")
call s:DefineCommand("mkdir", "Mkdir")

vmap <D-]> >gv
vmap <D-[> <gv


