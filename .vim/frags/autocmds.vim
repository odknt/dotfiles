" =========================================================================
" nvim support
"
augroup frags_autocmds_vim
    au!
    au BufEnter *.nvim set filetype=vim
augroup END

" =========================================================================
" The PC is fast enough, do syntax highlight syncing from start
"
augroup frags_autocmds_sync_fromstart
    au!
    au BufEnter * :syntax sync fromstart
augroup END

" =========================================================================
" Remember cursor position
"
augroup frags_autocmds_remember_cursor_position
    au!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" =========================================================================
" txt support
"
if !exists('*s:setupWrapping')
    " Startup Wrapping
    function s:setupWrapping()
        set wrap
        set wrapmargin=2
        set textwidth=79
    endfunction
endif

augroup frags_autocmds_wrapping
    au!
    au BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" =========================================================================
" make/cmake support
"
augroup frags_autocmds_make_cmake
    au!
    au FileType make setlocal noexpandtab
    au BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" =========================================================================
" Omni
"
augroup frags_autocmds_omni
    au!
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" =========================================================================
" Golang
"
augroup frags_autocmds_golang
    au!
    au BufWritePre *.go GoFmt
augroup END

" =========================================================================
" Neomake & Watchdogs
"
let g:syntax_check_command = 'WatchdogsRunSilent'
if has('nvim')
    let g:syntax_check_command = 'Neomake'
endif

augroup frags_autocmds_neomake_watchdogs
    au!
    " au InsertLeave,BufWritePost,TextChanged * exe g:syntax_check_command
    au BufNewFile,BufRead,BufWritePost * exe g:syntax_check_command
augroup END

" =========================================================================
" Hier & Highlight
"
augroup frags_autocmds_highlighting
    au!
    au BufWritePost * HierUpdate
augroup END
