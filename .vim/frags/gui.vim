if has('gui_mac') || has('gui_macvim')
    set guifont=Menlo:h12
    set transparency=7
endif

set guioptions=
set guifont=Inconsolata\ for\ Powerline\ Bold\ 10
set guifontwide=Rounded\ M+\ 1m\ Medium\ 10
set novb

" Disable italic
function! s:disable_italic()
    let l:his = ''
    redir => l:his
    silent hi
    redir END
    let l:his = substitute(l:his, '\n\s\+', ' ', 'g')
    for l:line in split(l:his, "\n")
        if l:line !~# ' links to ' && l:line !~# ' cleared$'
            exe 'hi' substitute(substitute(l:line, ' xxx ', ' ', ''), 'italic', 'none', 'g')
        endif
    endfor
endfunction
command! DisableItalic call s:disable_italic()

if has('vim_starting')
    call s:disable_italic()
    syntax on
endif
