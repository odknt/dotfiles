if exists('b:did_ftplugin_typescript')
    finish
endif
let b:did_ftplugin_typescript = 1

let g:TSS = ['tss', '--module', 'commonjs']
auto FileType typescript setlocal omnifunc=TSScompleteFunc
