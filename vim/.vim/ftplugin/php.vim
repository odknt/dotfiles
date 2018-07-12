if !exists("g:php_fixer_init")
    let g:php_fixer_init = 0
endif

if !g:php_fixer_init
    function! g:PhpFix(file)
        if executable('php-cs-fixer') && filereadable('./.php_cs')
            call system('php-cs-fixer fix ' . a:file)
            edit!
        endif

        if executable('phan_client') && filereadable('./.phan/config.php')
            let l:origin_errfmt = &errorformat
            let &errorformat = '%.%#error: %m in %f on line %l,%.%#:%m in %f on line %l,%-G%.%#'

            call setqflist([])
            caddexpr system('phan_client -l ' . a:file)
            let &errorformat = l:origin_errfmt

            let l:list = getqflist()
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
