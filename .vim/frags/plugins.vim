" {{{1 session management
let g:session_directory = g:vim_config_home . '/session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1

" {{{1 gitgutter
let g:gitgutter_map_keys = 0

" {{{1 vim-python
augroup vimrc_python
  au!
  au FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" {{{1 vim-airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" {{{1 Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" {{{1 Watchdogs

" Watchdogs target language's extension
let $watchdogs_target = '*.js,*.ts,*.go,*.php,*.py,*.lua,*.vim*,vimrc'
let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1
augroup vimrc_local_watchdogs
    autocmd!
    " autocmd InsertLeave,BufWritePost,TextChanged $watchdogs_target WatchdogsRunSilent
    autocmd BufNewFile,BufRead $watchdogs_target WatchdogsRunSilent
augroup END

" {{{1 QuickrunConfig
let g:quickrun_config = {
    \   '_': {
    \       'runner': 'vimproc',
    \       'outputter/quickfix/open_cmd': '',
    \       'runner/vimproc/updatetime': 10
    \   },
    \   'gtags': {
    \       'command': 'gtags',
    \       'exec': '%c',
    \       'outputter': 'error:buffer:quickfix'
    \   },
    \   'watchdogs_checker/_': {
    \       'runner/vimproc/updatetime': 10
    \   },
    \   'vim/watchdogs_checker': {
    \       'type': executable('vint') ? 'watchdogs_checker/vint' : 'watchdogs_checker/vim-vimlint'
    \   },
    \   'watchdogs_checker/vint': {
    \       'command': 'vint',
    \       'exec': '%c %o %s:p'
    \   },
    \   'watchdogs_checker/php': {
    \       'command': 'php',
    \       'cmdopt':  '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
    \        'exec':    '%c %o %s:p',
    \        'errorformat': '%m\ in\ %f\ on\ line\ %l'
    \   },
    \   'watchdogs_checker/shellcheck': {
    \       'command': 'shellcheck',
    \       'cmdopt': '-f gcc',
    \   },
    \   'sh/watchdogs_checker': {
    \       'type': 'watchdogs_checker/shellcheck'
    \   },
    \   'watchdogs_checker/tslint': {
    \       'command': 'tslint',
    \       'exec': '%c %o %s:p',
    \       'cmdopt': '--module commonjs'
    \   },
    \   'typescript/watchdogs_checker': {
    \       'type': 'watchdogs_checker/tslint'
    \   }
    \ }

" {{{1 Gtags
"let g:unite_source_gtags_ref_option = 'r'
let g:unite_source_gtags_def_option = 'i'
"let g:unite_source_gtags_result_option = 'ctags-x'

" {{{1 Go
filetype plugin indent on
auto BufWritePre *.go Fmt
let $GOPATH = $GOPATH . globpath(getcwd(), '_vendor')
set completeopt=menu

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1

" {{{1 Ctags looks up and up
set tags=~/.cache/tags_dir/*/prj_tags

" {{{1 Riot
au BufRead,BufNewFile *.tag set filetype=javascript
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" {{{1 TweetVim
let s:tweetvim_update_interval_seconds = 60
let s:tweetvim_timestamp = reltime()[0]

" {{{1 Markdown
set syntax=markdown
au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:previm_enable_realtime = 1
let g:previm_custom_css_path = g:vim_config_home.'/previm.css'

" {{{1 deoplete
let g:deoplete#enable_at_startup = 1
