set backspace=indent,eol,start
set autoindent
set smartindent
set autoread

" Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Enable hidden buffer
set hidden

" Text width
set textwidth=0

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set noshowmatch

" Directories for swp files
set nobackup
set noswapfile

" Format
set fileformats=unix,dos,mac
set showcmd

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Mouse settings
set mouse=

" Clipboard
if ('unnnamedplus')
    set clipboard+=unnamedplus
else
    set clipboard+=unnamed
endif

" Complete
set completeopt=menuone
set complete=.
set pumheight=20
