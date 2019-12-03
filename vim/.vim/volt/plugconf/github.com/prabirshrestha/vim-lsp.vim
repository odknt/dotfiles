" vim:et:sw=2:ts=2

" Plugin configuration like the code written in vimrc.
" This configuration is executed *before* a plugin is loaded.
function! s:on_load_pre()
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1

  if executable('clangd')
    augroup volt_vim_lsp
    au!
    au User lsp_setup call lsp#register_server({
      \ 'name': 'clangd',
      \ 'cmd': {server_info->['clangd', '--pch-storage=memory']},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
      \ })
    augroup END
    nmap <C-]> :tab split<cr><plug>(lsp-definition)
    nmap gr <plug>(lsp-references)
    nmap gR <plug>(lsp-rename)
  endif
endfunction

" Plugin configuration like the code written in vimrc.
" This configuration is executed *after* a plugin is loaded.
function! s:on_load_post()
endfunction

" This function determines when a plugin is loaded.
"
" Possible values are:
" * 'start' (a plugin will be loaded at VimEnter event)
" * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
" * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
" <filetypes> and <excmds> can be multiple values separated by comma.
"
" This function must contain 'return "<str>"' code.
" (the argument of :return must be string literal)
function! s:loaded_on()
  return 'start'
endfunction

" Dependencies of this plugin.
" The specified dependencies are loaded after this plugin is loaded.
"
" This function must contain 'return [<repos>, ...]' code.
" (the argument of :return must be list literal, and the elements are string)
" e.g. return ['github.com/tyru/open-browser.vim']
function! s:depends()
  return ['github.com/prabirshrestha/async.vim']
endfunction