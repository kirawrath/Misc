set number
set ruler
syn on
syntax on
filetype indent on
set backspace=indent,eol,start
filetype plugin on
set tabstop=4
set shiftwidth=4
set nobackup
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set incsearch
set hlsearch
set expandtab

"execute pathogen#infect()

nmap <C-h> :tp <CR>
nmap <C-l> :tn <CR>

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"set completeopt-=preview

"F9 to open functions calling current function
nmap <F9> :cs find c <cword><CR>
nmap <F8> :cs find s <cword><CR>

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"Required by vim-latex
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"
nmap <F7> :TagbarToggle<CR>


"creates a main() into new *cc files
function Make_cc_main()
    read ~/.vim/main.cc
    1 "delete the unwanted first newline
    delete 
    10 "jump to main's beginning
endfunction
function Make_py_main()
    read ~/.vim/main.py
    1 "delete the unwanted first newline
    delete
    $
endfunction
"au bufnewfile *.cc call Make_cc_main()
"au bufnewfile *.cpp call Make_cc_main()
"au bufnewfile *.py call Make_py_main()
"""
au BufRead,BufNewFile *.log  set filetype=chanlog
au BufRead,BufNewFile *.test set filetype=test
nmap <F10> :echo @%<CR>
nmap <F6> :!ctags -R . && cscope -Rb<CR><CR>
nmap <F5> :!g++ % && ./a.out<CR>
vnoremap // y/<C-R>"<CR>

let g:clang_use_library = 0
