if !exists("g:php_fixer_init")
    let g:php_fixer_init = 0
endif

" regexp
let s:lnum_regxp = '\von\sline\s\zs\d+'
let s:msg_regxp = '\v[^:]+:[^:]+:[^:]+:\s\zs.+\ze\sin\s'
let s:err_regxp = '\vParse\serror:\s\zs.+\ze\sin\s'

if !g:php_fixer_init
    function! s:ParsePhan(output)
        let l:list = []
        let l:i = 0
        while l:i < len(a:output)
            let l:msg = matchstr(a:output[i], s:msg_regxp, 0)
            let l:lnum = matchstr(a:output[i], s:lnum_regxp, 0)
            if empty(l:msg)
                let l:msg = matchstr(a:output[i], s:err_regxp, 0)
            endif
            if !empty(l:msg) && !empty(l:lnum)
                let l:qf = {'bufnr': bufnr(''), 'lnum': l:lnum, 'text': l:msg}
                call add(l:list, l:qf)
            endif
            let l:i = l:i + 1
        endwhile
        return l:list
    endfunction

    function! g:PhpFix(file)
        if executable('php-cs-fixer') && filereadable('./.php_cs')
            call system('php-cs-fixer fix ' . a:file)
            edit!
        endif

        if executable('phan_client') && filereadable('./.phan/config.php')
            call setqflist([])
            let l:list = s:ParsePhan(split(system('phan_client -l ' . a:file), '\n'))

            if empty(l:list)
                ccl
            else
                call setqflist(l:list)
                cw
            endif
        endif
    endfunction

    augroup php_fixer
        au!
        au BufWritePost *.php call PhpFix(expand('%:p'))
    augroup END

    let g:php_fixer_init = 1
endif
