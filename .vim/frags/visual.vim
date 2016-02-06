set ruler
set nonumber
set wildmenu
set lazyredraw
set ttyfast
set foldmethod=manual
set ambiwidth=double

" Change split lines
if &encoding ==? 'utf-8'
    exec "set fillchars=vert:\u23AE,fold:\u23BC,diff:\u23BC"
else
    exec 'set fillchars=vert:\|,fold:-,diff:.'
endif
hi VertSplit ctermfg=black ctermbg=61

" Not move cursor to the first empty line at scroll
set nostartofline

" Split window options
set splitbelow
set splitright

" Command line height
set cmdheight=2

" Right mouse button option
set mousemodel=popup

" Word wrap
set linebreak
set showbreak=\
set breakat=\ \ ;:,!?
if exists('+breakindent')
    set wrap
    set breakindent
else
    set nowrap
endif

" Disable visualbell
set novisualbell

" Background color
set background=dark

" Show lastline
set display=lastline

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
    \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}\ %m"
    \ . "\ %=%{len(getloclist(0))?'E:\ '.len(getloclist(0)):''}"
    \ . "\ %{(winnr('$')==1 || winnr('#')!=winnr()) ? '['.(&filetype!=''?&filetype.',':'')"
    \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
    \ . "%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F
