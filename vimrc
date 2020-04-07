"" Sgoldman inserts

" Set UTF8 Support
set encoding=utf-8

set nocompatible
filetype off
set nu

" use Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Python pep8
Plugin 'Vimjas/vim-python-pep8-indent'
" To generate pydocstring
Plugin 'heavenshell/vim-pydocstring' 
" Autocompletion
Plugin 'ajh17/vimcompletesme'
" Fuzzy file autocomplete
Plugin 'ctrlpvim/ctrlp.vim'



autocmd FileType vim let b:vcm_tab_complete = 'vim'


call vundle#end()            " required
filetype plugin indent on    " required


let g:pydocstring_formatter = 'numpy'



set backspace=indent,eol,start 
set mouse+=a
set ttymouse=xterm2

" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4  | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set smartindent |
    \ set fileformat=unix

" Use python-pep8-indent
filetype indent on

" Always set expandtab
set expandtab

" Enable folding with spacebar
nnoremap <space> za
set foldmethod=indent
set foldlevel=99

" Set syntax highlighting
syntax on 


" Insanely helpful copy to system keyboard using ''
vmap '' :w !pbcopy<CR><CR>


