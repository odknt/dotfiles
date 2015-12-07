" Init: variables for lazy load {{{
let b:for_unite = [ 'unite' ]
let b:on_unite = [ 'Unite' ]
let b:on_tweetvim = [ 'TweetVimHomeTimeline' ]
let b:on_watchdogs = [ 'WatchdogsRun', 'WatchdogsRunSilent', 'WatchdogsRunSweep' ]
" }}}

" {{{1 dirvish
Plug 'justinmk/vim-dirvish'
noremap <F3> :Dirvish<CR>

" {{{1 Commentary
Plug 'tpope/vim-commentary'

" {{{1 Git
Plug 'airblade/vim-gitgutter'

" {{{1 CtrlP: Grep file path
Plug 'ctrlpvim/ctrlp.vim'

" {{{1 Airline: Enchansment status bar like Powerline
" Plug 'bling/vim-airline'

" {{{1 LanguagePack
Plug 'sheerun/vim-polyglot'

" {{{1 Grep
Plug 'vim-scripts/grep.vim'
let g:Grep_Default_Options = '-IR'

" {{{1 TrailingWhitespace
Plug 'bronson/vim-trailing-whitespace'

" {{{1 VimProc: Required
Plug 'Shougo/vimproc.vim', { 'do' : 'make -f make_unix.mak' }

" {{{1 VimSession
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" {{{1 Color
Plug 'vim-scripts/CSApprox'
Plug 'tomasr/molokai'

" {{{1 Snippets
if v:version >= 704
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'FelikZ/ctrlp-py-matcher'
endif

" {{{1 VimShell
if v:version >= 703
    Plug 'Shougo/vimshell.vim'

    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_prompt =  '$ '
endif

" {{{1 InddentLine: Show indent level
Plug 'Yggdroot/indentLine'


" {{{1 Tagbar
Plug 'majutsushi/tagbar', {
    \ 'for': [ 'go', 'python', 'rust', 'php' ],
    \ }

" {{{1 Python
Plug 'davidhalter/jedi-vim', {
    \ 'for': [ 'python' ],
    \ }

" {{{1 Golang
Plug 'fatih/vim-go', { 'for': [ 'go' ] } |
    \ Plug 'vim-jp/vim-go-extra', { 'for': [ 'go' ] }

" {{{1 HTML
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'less', 'sass', 'scss' ] }
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'js', 'jsx', 'markdown', 'typescript' ] }

" {{{1 Unite
Plug 'Shougo/unite.vim', { 'on': 'Unite', 'for': [ 'unite' ] }

" {{{1 QuickRun
Plug 'thinca/vim-quickrun'
let g:quickrun_config = { '*': { 'hook/time/enable': '1' } }

" {{{1 Easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = "'"
let g:EasyMotion_grouping = 1
let g:EasyMotion_use_migemo = 1

" {{{1 Wildfire
Plug 'gcmt/wildfire.vim'
let g:wildfire_water_map = '<S-Enter>'
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']

" {{{1 Rust: language support
Plug 'rust-lang/rust.vim', { 'for': [ 'rust' ] }

" {{{1 Rust: Tagbar settings
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" {{{1 Bdelete: Delete a buffer without closing the window.
Plug 'moll/vim-bbye'

" {{{1 Vim Surround
Plug 'tpope/vim-surround'

" {{{1 PHP
Plug 'arnaud-lb/vim-php-namespace', { 'for': [ 'php' ] }

" {{{1 Vdebug
Plug 'joonty/vdebug', { 'for': [ 'php' ] }
let g:vdebug_options = {
    \ 'server' : 0.0.0.0,
    \ 'break_on_open' : 0,
    \ 'path_maps' : {
    \ }}

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
