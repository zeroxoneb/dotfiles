"""""""""""
" General "
"""""""""""
" Enable features not Vi compatible
set nocompatible

" Initialize pathogen
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin on
filetype indent on

""""""
" UI "
""""""
" Show line numbers
set number

" Redrew only when we need to
set lazyredraw

""""""""""""
" NERDtree "
""""""""""""
autocmd StdinReadPre * let s:std_in=1

" Start nerdtree when no files are provided
autocmd VimEnter * if argc() == 0 &&
      \ !exists("s:std_in") |
      \ NERDTree | endif
" Start nerdstree when a directory is provided
autocmd VimEnter * if argc() == 1 &&
      \ isdirectory(argv()[0]) &&
      \ !exists("s:std_in") |
      \ exe 'NERDTree' argv()[0] |
      \ wincmd p | ene | exe 'cd '.argv()[0] | endif
" ctrl-n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

"""""""""""
" Airline "
"""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

""""""""""""""""
" Colors/Fonts "
""""""""""""""""
syntax on
set background=dark
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

" Enable 256 colors in Vim
set t_Co=256

" Colored column for max line
highlight ColorColumn ctermbg=red
set colorcolumn=101

""""""""""""""""""""
"  Text/Tab/Indent "
""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" File type specific options overwrite these parameters (see .vim/after/ftplugin)
" 1 tab = 2 spaces
set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent
set shiftround

" Smart backspace
set backspace=indent,eol,start

""""""""""
" Search " 
""""""""""
" Return to last edit position when opening files
autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
" Remember info about open buffers on close
set viminfo^=%

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable expansion with delimitMate
let g:delimitMate_expand_cr = 1

" Starlark/buck
au BufRead,BufNewFile *.bzl set filetype=python
au BufRead,BufNewFile BUCK set filetype=python
au BufRead,BufNewFile BUILD set filetype=python
au BufRead,BufNewFile TARGETS set filetype=python
