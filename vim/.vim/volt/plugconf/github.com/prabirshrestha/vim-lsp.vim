" vim:et:sw=2:ts=2

function! s:on_load_pre()
  let g:lsp_signs_enabled = 1
  let g:lsp_document_code_action_signs_enabled = 0
  let g:lsp_diagnostics_virtual_text_prefix = ' ‣ '
  let g:lsp_diagnostics_virtual_text_align = 'after'
  let g:lsp_diagnostics_virtual_text_padding_left = 1
  let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1

  hi LspErrorVirtualText ctermbg=red
  hi LspWarningVirtualText ctermfg=black ctermbg=yellow
  hi LspInformationVirtualText ctermfg=black ctermbg=cyan
  hi LspHintVirtualText ctermfg=black ctermbg=cyan

  augroup volt_vim_lsp
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    autocmd BufWritePre *.go LspDocumentFormatSync
  augroup END
endfunction

" Plugin configuration like the code written in vimrc.
" This configuration is executed *after* a plugin is loaded.
function! s:on_load_post()
endfunction

function! s:loaded_on()
  return 'start'
endfunction

function! s:depends()
  return []
endfunction

func! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal keywordprg=:LspHover

  nmap <silent><buffer>gi <plug>(lsp-implementation)
  nmap <silent><buffer>ga <plug>(lsp-code-action)
  " nmap <silent><buffer>gd <plug>(lsp-definition)
  nmap <silent><buffer>gd :tab LspDefinition<CR>
  nmap <silent><buffer>gk <plug>(lsp-peek-definition)

  nmap <silent><buffer>K <plug>(lsp-hover)
  nnoremap <silent><expr><PageUp> lsp#scroll(-4)
  nnoremap <silent><expr><PageDown> lsp#scroll(+4)
endfunc
