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

" Add lightline  + color scheme
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'

" Switch from tabs to buffers
" Plugin 'ap/vim-buftabline'

" Gitgutter
Plugin 'airblade/vim-gitgutter'

" Search entire repos
Plugin 'dyng/ctrlsf.vim'

" Add multiple cursor support
Plugin 'terryma/vim-multiple-cursors'

" Add surround for brakcet insertion
"Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" Add NERDtree for file browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Add linting
Plugin 'dense-analysis/ale'

" Add tagbar
Plugin 'preservim/tagbar'
" Plugin 'ludovicchabant/vim-gutentags'

autocmd FileType vim let b:vcm_tab_complete = 'vim'

call vundle#end()            " required
filetype plugin indent on    " required

let g:pydocstring_formatter = 'google'

" mouse
set backspace=indent,eol,start 
set mouse+=a
set ttymouse=xterm2
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction


" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4  | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set smartindent |
    \ set fileformat=unix | 
    \ set colorcolumn=80


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

" Helpful copy to system keyboard using ''
vmap '' :w !pbcopy<CR><CR>

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Add boilerplate to top of new codes
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  augroup END
endif

""" 

" always show the status bar
set laststatus=2

" enable 256 colors
set t_Co=256
set t_ut=

" turn on line numbering
set number

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8


" Different file types
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Set viminfo location
set viminfo='25,\"50,n~/.viminfo

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" color scheme
syntax on
colorscheme onedark
filetype on
filetype plugin indent on

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bp<bar>bd#<CR>


" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-q> <Plug>(ale_previous_wrap)

" tags
map <leader>t :TagbarToggle<CR>

" Add faster save
nmap <Leader>w :w<CR>


" let g:tagbar_use_universal_ctags = 1
" let g:gutentags_trace = 1

let g:AutoPairsShortcutFastWrap = '<C-a>'
