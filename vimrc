"" Sgoldman inserts

set nocompatible
filetype off
set nu
set backspace=indent,eol,start 
set mouse+=a

"Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4  | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set smartindent |
    \ set fileformat=unix

" Always set expandtab
set expandtab

" Enable folding with spacebar
nnoremap <space> za
set foldmethod=indent
set foldlevel=99

" Set syntax highlighting
syntax on 

" Set UTF8 Support
set encoding=utf-8
