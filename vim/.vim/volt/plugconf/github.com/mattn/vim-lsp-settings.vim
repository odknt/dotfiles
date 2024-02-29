" vim:et:sw=2:ts=2

function! s:on_load_pre()
  let g:lsp_settings_filetype_python = ['pylsp-all', 'pyright-langserver']
endfunction

" Plugin configuration like the code written in vimrc.
" This configuration is executed *after* a plugin is loaded.
function! s:on_load_post()
endfunction

function! s:loaded_on()
  return 'start'
endfunction

function! s:depends()
  return ['github.com/prabirshrestha/vim-lsp']
endfunction
