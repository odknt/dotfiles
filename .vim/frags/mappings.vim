" Map leader
let g:mapleader="\<Space>"

if !has('nvim')
    nnoremap <leader>sh :<C-u>sh<CR>
endif

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamedplus
endif

" Open location list
noremap <silent> <leader>l :<C-u>lwindow<CR>

" Save
noremap <leader>w :<C-u>w<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" session management
nnoremap <leader>so :<C-u>OpenSession
nnoremap <leader>ss :<C-u>SaveSession
nnoremap <leader>sd :<C-u>DeleteSession<CR>
nnoremap <leader>sc :<C-u>CloseSession<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :<C-u>tabnew<CR>

" Save as super user
cnoremap w!! w !sudo tee > /dev/null %

" Dirvish (filer)
noremap <F3> :<C-u>Dirvish<CR>

" Directory
" Set working directory
nnoremap <silent> <leader>. :<C-u>lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :<C-u>e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :<C-u>tabe <C-R>=expand("%:p:h") . "/" <CR>

" Grep
nnoremap <silent> <leader>f :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :<C-u>CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>p'
let g:ctrlp_open_new_file = 'r'

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
let g:UltiSnipsEditSplit='vertical'

" Buffer nav
noremap <leader>z :<C-u>bp<CR>
noremap <leader>j :<C-u>bp<CR>
noremap <leader>x :<C-u>bn<CR>
noremap <leader>k :<C-u>bn<CR>

" Close buffer
noremap <leader>c :<C-u>bd<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :<C-u>noh<cr>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = '<leader>d'
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>r'
let g:jedi#show_call_signatures = '0'
let g:jedi#completions_command = '<C-Space>'

" Tagbar
nmap <silent> <F4> :<C-u>TagbarToggle<CR>

" Bbye
nnoremap <Leader>q :<C-u>Bdelete<CR>

" Watchdogs
nnoremap <C-c> :<C-u>WatchdogsRunSilent<CR>

" Go
augroup frags_mappings_golang
    au!
    au FileType go nnoremap [go] <nop>
    au FileType go nmap s [go]
    au FileType go nmap [go]r <Plug>(go-run)
    au FileType go nmap [go]b <Plug>(go-build)
    au FileType go nmap [go]t <Plug>(go-test)
    au FileType go nmap [go]gc <Plug>(go-coverage)
    au FileType go nmap [go]gr <Plug>(go-referrers)
    au FileType go nmap [go]gd <Plug>(go-def)
    au FileType go nmap [go]gs <Plug>(go-def-split)
    au FileType go nmap [go]gv <Plug>(go-def-vertical)
    au FileType go nmap [go]dc <Plug>(go-doc)
    au FileType go nmap [go]dv <Plug>(go-doc-vertical)
    au FileType go nmap [go]do <Plug>(go-doc-browser)
    au FileType go nmap [go]s <Plug>(go-implements)
    au FileType go nmap [go]i <Plug>(go-info)
    au FileType go nmap [go]n <Plug>(go-rename)
augroup END

" Gtags Show function list in current file
nnoremap <leader><C-l> :<C-u>Unite gtags/file<CR>
" Gtags Grep
nnoremap <leader><C-g> :<C-u>Unite gtags/grep<CR>
" Gtags Show def under cursor
nnoremap <leader><C-]> :<C-u>Unite gtags/def<CR>
vnoremap <leader><C-]> :<C-u>Unite gtags/def<CR>
" Gtags Show ref under cursor
nnoremap <leader><C-k> :<C-u>Unite gtags/ref<CR>
vnoremap <leader><C-k> :<C-u>Unite gtags/ref<CR>
" Gtags Show all tokens
nnoremap <leader><C-/> :<C-u>Unite gtags/completion<CR>
