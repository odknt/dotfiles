" =========================================================================
" Neomake & Watchdogs
"
let g:syntax_check_command = 'WatchdogsRunSilent'
if has('nvim')
    let g:syntax_check_command = 'Neomake'
endif

" =========================================================================
" autocmd
"
augroup frags_autocmds
    au!

    " nvim support
    au BufEnter *.nvim set filetype=vim

    " The PC is fast enough, do syntax highlight syncing from start
    au BufEnter * :syntax sync fromstart

    " Remember cursor position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " make/cmake support
    au FileType make setlocal noexpandtab
    au BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

    " Omni
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Golang
    au BufWritePre *.go GoFmt

    " Neomake or Watchdogs
    " au BufNewFile,BufRead,BufWritePost * exe g:syntax_check_command

    " Hier & Highlight
    " au BufWritePost * HierUpdate

    " Renewal unnamed buffer
    au VimEnter * if argc() == 0 && bufname('%') ==# '' | enew | endif
augroup END
