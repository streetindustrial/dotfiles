""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" industrialsynthfreak - industrialsynthfreak@privacyrequired.com
" ~/.vimrc for web dev apps
" 04/01/17

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen

execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

set nocompatible

set hidden
set history=1000
set autoread
set shell=bash
set t_ti= t_te=

" search / patterns
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" visuals / interface

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set cursorline
set cmdheight=1
set switchbuf=useopen
set number
set numberwidth=4
set showtabline=2
set winwidth=79
set showcmd
set wildmode=longest,list
set wildmenu
syntax on
filetype plugin indent on
let python_highlight_all = 1

set backspace=indent,eol,start
let mapleader=","

" files / directories

set backup
set backupdir=~/.vim/tmp,~/var/tmp,/tmp
set directory=~/.vim/tmp,~/var/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS

augroup vimrcCommands
    autocmd!
    " Text wrapping
    autocmd FileType text setlocal textwidth=79
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%79v.*/
    " Jump to last cursor pos unless it's invalid or in an event handler
    autocmd BufReadPost *
                \ if line ("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" |
                \ endif
    " Custom indentation settings
    autocmd FileType python set ai sw=4 sts=4 et
    autocmd FileType
                \ shell,
                \ ruby,eruby,
                \ haml,hml,html,xhtml,xml,
                \ javascript,json,coffee,
                \ css,scss,sass,
                \ yaml,yml
                \ set ai sw=2 sts=2 et
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPING

" Tabs / buffers navigation
nnoremap <C-k> :tabprevious<CR>
vnoremap <C-k> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
vnoremap <C-l> :tabnext<CR>
" Windows / splits navigation
" Alt keys mapping for OSX is pretty weird
" This is alt-h|j|k|l actually
nnoremap ˙ <C-w>h
vnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
vnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
vnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l
vnoremap ¬ <C-w>l
" Copy All command
nnoremap <C-A> ggyGG$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPECIAL STUFF / FUNCTIONS

" Use TAB to complete when typing words, else insert TABs as usual
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

