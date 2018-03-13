set nocompatible
set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'keith/swift.vim'
call plug#end()

let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0

map <C-p> :Files<CR>

filetype plugin indent on
syntax enable

set number
set autoread
set updatecount=0
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ ,eol:¬
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

:nnoremap <CR> :nohlsearch<cr>

let mapleader=","
set laststatus=2

" Beanshell.
autocmd BufNewFile,BufRead *.bsh   set syntax=java

" colorscheme industry
" highlight NonText ctermfg=8 guifg=gray
" highlight SpecialKey ctermfg=8
" highlight LineNr ctermfg=242

" Trim whitespace.
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
autocmd BufWritePre * :call TrimWhitespace()

" FZF.
let g:fzf_tags_command = 'ctags -R'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

set scrolloff=8
set nobackup
set noswapfile
set visualbell t_vb=
set wildmode=longest,list

set splitbelow
set splitright

