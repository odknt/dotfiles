" Init: variables for lazy load {{{
let b:for_unite = [ 'unite' ]
let b:on_unite = [ 'Unite' ]
let b:on_tweetvim = [ 'TweetVimHomeTimeline' ]
let b:on_watchdogs = [ 'WatchdogsRun', 'WatchdogsRunSilent', 'WatchdogsRunSweep' ]
" }}}

" {{{1 dirvish
Plug 'justinmk/vim-dirvish'

" {{{1 Commentary
Plug 'tpope/vim-commentary'

" {{{1 Git
Plug 'airblade/vim-gitgutter'

" {{{1 CtrlP Grep file path
Plug 'ctrlpvim/ctrlp.vim' | Plug 'nixprime/cpsm', { 'do': './install.sh' }

" {{{1 LanguagePack
Plug 'sheerun/vim-polyglot'

" {{{1 Grep
Plug 'vim-scripts/grep.vim'

" {{{1 TrailingWhitespace
Plug 'bronson/vim-trailing-whitespace'

" {{{1 VimProc: Required
Plug 'Shougo/vimproc.vim', { 'do' : 'make -f make_unix.mak' }

" {{{1 VimSession
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" {{{1 Color
Plug 'vim-scripts/CSApprox'

" {{{1 Color Scheme
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

" {{{1 Golang
Plug 'fatih/vim-go', { 'for': [ 'go' ] }

" {{{1 HTML
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'less', 'sass', 'scss' ] }
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'js', 'jsx', 'markdown', 'typescript' ] }

" {{{1 Unite
Plug 'Shougo/unite.vim', { 'on': 'Unite', 'for': [ 'unite' ] }

" {{{1 QuickRun
Plug 'thinca/vim-quickrun'

" {{{1 Easymotion
Plug 'easymotion/vim-easymotion'

" {{{1 Wildfire
Plug 'gcmt/wildfire.vim'

" {{{1 Rust: language support
Plug 'rust-lang/rust.vim', { 'for': [ 'rust' ] }

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

" {{{1 GAS
Plug 'Shirk/vim-gas', { 'for': [ 'gas' ] }

" {{{1 Gtags
Plug 'jsfaint/gen_tags.vim'
Plug 'hewes/unite-gtags', { 'on': b:on_unite, 'for': b:for_unite } |
    \ Plug 'odknt/unite-gtags-custom', { 'on': b:on_unite, 'for': b:for_unite }

" {{{1 Twitter
Plug 'tyru/open-browser.vim' |
    \ Plug 'basyura/twibill.vim', { 'on': b:on_tweetvim } |
    \ Plug 'basyura/TweetVim', { 'on': b:on_tweetvim }

" {{{1 Riot
Plug 'nicklasos/vim-jsx-riot', { 'for': [ 'javascript' ] }

" {{{1 Vimscript
Plug 'syngan/vim-vimlint'

" {{{1 Watchdogs
Plug 'dannyob/quickfixstatus', { 'on': b:on_watchdogs } |
Plug 'jceb/vim-hier', { 'on': b:on_watchdogs } |
Plug 'osyo-manga/shabadou.vim', { 'on': b:on_watchdogs } |
    \ Plug 'osyo-manga/vim-watchdogs', { 'on': b:on_watchdogs } |
" {{{2 Typescript
    \ Plug 'clausreinke/typescript-tools.vim', {
    \   'do': 'npm install -g',
    \   'for': [ 'typescript' ]
    \ }

" {{{1 lexima.vim
Plug 'cohama/lexima.vim'

" {{{1 previm
Plug 'kannokanno/previm', {
    \ 'for': [ 'markdown' ]
    \ }

" {{{1 vim-test
Plug 'janko-m/vim-test'
