" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc_sync_fromstart
  au!
  au BufEnter * :syntax sync fromstart
augroup END

" Remember cursor position
augroup vimrc_remember_cursor_position
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt support
augroup vimrc_wrapping
  au!
  au BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake support
augroup vimrc_make_cmake
  au!
  au FileType make setlocal noexpandtab
  au BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" Omni
augroup vimrc_local_omni
    au!
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
