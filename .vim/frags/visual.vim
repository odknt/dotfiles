set ruler
set nonumber
set wildmenu
set lazyredraw
set ttyfast
set ambiwidth=double
set foldmethod=marker

" Not move cursor to the first empty line at scroll
set nostartofline

" Split window options
set splitbelow
set splitright

" Command line height
set cmdheight=2

" Right mouse button option
set mousemodel=popup
set t_Co=256

set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name='molokai'
let g:no_buffers_menu=1
let g:molokai_original = 1
let g:rehash256 = 1

" Disable visualbell
set novisualbell

" Show lastline
set display=lastline

let g:CSApprox_loaded = 1

if &term ==# 'xterm'
    set term=xterm-256color
endif

if &term =~# '256color'
    set t_ut=
endif

" Disable the blinking cursor.
set guicursor=a:blinkon0
set scrolloff=3

" Statusline
set laststatus=2
set showmode

" Set statusline.
let &statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
    \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
    \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
    \ . "\ %=%{len(getloclist(0))?'E:\ '.len(getloclist(0)):''}"
    \ . "\ %{(winnr('$')==1 || winnr('#')!=winnr()) ? '['.(&filetype!=''?&filetype.',':'')"
    \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
    \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

syntax off
