" Init: variables for lazy load {{{
let b:for_unite = [ 'unite' ]
let b:on_unite = [ 'Unite' ]
let b:on_tweetvim = [ 'TweetVimHomeTimeline' ]
let b:on_watchdogs = [ 'WatchdogsRun', 'WatchdogsRunSilent', 'WatchdogsRunSweep' ]
" }}}

" {{{1 NERDTree
Plug 'scrooloose/nerdtree'

" {{{1 ag.vim
Plug 'rking/ag.vim'

" {{{1 Commentary
Plug 'tpope/vim-commentary'

" {{{1 CtrlP Grep file path
Plug 'ctrlpvim/ctrlp.vim' | Plug 'nixprime/cpsm', { 'do': './install.sh' }

" {{{1 LanguagePack
" Plug 'sheerun/vim-polyglot'

" {{{1 Golang
Plug 'fatih/vim-go', { 'for': [ 'go' ] }
Plug 'garyburd/go-explorer', { 'for': [ 'go' ] }

" {{{1 Grep
Plug 'vim-scripts/grep.vim'

" {{{1 VimProc: Required
Plug 'Shougo/vimproc.vim', { 'do' : 'make -f make_unix.mak' }

" {{{1 VimSession
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" {{{1 Color Scheme
" Plug 'vim-scripts/CSApprox'
Plug 'tomasr/molokai'

" {{{1 Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" {{{1 Tagbar
Plug 'majutsushi/tagbar', {
    \ 'for': [ 'go', 'python', 'rust', 'php' ],
    \ }

" {{{1 Python
Plug 'davidhalter/jedi-vim', {
    \ 'for': [ 'python' ],
    \ }


" {{{1 HTML
" Plug 'mattn/emmet-vim', { 'for': [ 'html', 'js', 'jsx', 'markdown', 'typescript' ] }

" {{{1 Unite
Plug 'Shougo/unite.vim', { 'on': 'Unite', 'for': [ 'unite' ] }

" {{{1 QuickRun
Plug 'thinca/vim-quickrun'

" {{{1 Bdelete: Delete a buffer without closing the window.
Plug 'moll/vim-bbye'

" {{{1 Vim Surround
Plug 'tpope/vim-surround'

" {{{1 PHP
Plug 'arnaud-lb/vim-php-namespace', { 'for': [ 'php' ] }

" {{{1 Vdebug
Plug 'joonty/vdebug', { 'for': [ 'php' ] }

" {{{1 EditorConfig
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/PreserveNoEOL'

" {{{1 Gtags
Plug 'jsfaint/gen_tags.vim'
Plug 'hewes/unite-gtags', { 'on': b:on_unite, 'for': b:for_unite } |
    \ Plug 'odknt/unite-gtags-custom', { 'on': b:on_unite, 'for': b:for_unite }

" {{{1 Vimscript
Plug 'syngan/vim-vimlint'

" {{{1 vim-hier
Plug 'cohama/vim-hier'

" {{{1 Watchdogs
Plug 'dannyob/quickfixstatus', { 'on': b:on_watchdogs } |
Plug 'osyo-manga/shabadou.vim', { 'on': b:on_watchdogs } |
    \ Plug 'osyo-manga/vim-watchdogs', { 'on': b:on_watchdogs } |
" {{{2 Typescript
    \ Plug 'clausreinke/typescript-tools.vim', {
    \   'do': 'npm install -g',
    \   'for': [ 'typescript' ]
    \ }


" {{{1 livemark.vim
Plug 'miyakogi/livemark.vim', {
    \ 'for': [ 'markdown' ]
    \ }

" {{{1 vim-test
Plug 'janko-m/vim-test'

" {{{1 YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" {{{1 vim-gista
Plug 'lambdalisue/vim-gista'

" {{{1 vim-coffee-script
Plug 'kchmck/vim-coffee-script'

" {{{1 memolist.vim
Plug 'glidenote/memolist.vim'

" vim: foldmethod=marker
