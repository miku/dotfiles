set nocompatible
set encoding=utf-8
set nrformats-=octal

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'flazz/vim-colorschemes'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/space-vim-theme'
Plug 'cespare/vim-toml'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'goerz/jupytext.vim'
Plug 'vmchale/polyglot-vim'
Plug 'noahfrederick/vim-noctu'
Plug 'noahfrederick/vim-hemisu'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'rust-lang/rust.vim'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rhysd/git-messenger.vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'skywind3000/vim-keysound'
Plug 'tmhedberg/SimpylFold'

" Plug 'editorconfig/editorconfig-vim'
" Plug 'qualiabyte/vim-colorstepper'
call plug#end()

" ColorStepper Keys
" nmap <F6> <Plug>ColorstepPrev
" nmap <F7> <Plug>ColorstepNext
" nmap <S-F7> <Plug>ColorstepReload

" Pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#spell#enabled = 0

" vim-go
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0

let g:formatdef_custom_c = '"astyle --mode=c --style=linux --align-pointer=name"'
let g:formatters_c = ['custom_c']

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

map <C-p> :Files<CR>

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

filetype plugin indent on
syntax enable

set number
set autoread
set updatecount=0
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set nolist
" set listchars=tab:→\ ,eol:¬
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
highlight NonText ctermfg=8 guifg=gray
highlight SpecialKey ctermfg=242
highlight LineNr ctermfg=242

" Trim whitespace.
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
autocmd BufWritePre * :call TrimWhitespace()

" Autoformat
au BufWrite *.html :Autoformat
au BufWrite *.css :Autoformat
au BufWrite *.js :Autoformat
" au BufWrite *.py :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

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

highlight SpecialKey ctermfg=8
highlight LineNr ctermfg=darkgrey

" colorscheme Tomorrow-Night-Eighties
set background=dark
colorscheme space_vim_theme
" colorscheme Light
" colorscheme hemisu

nnoremap 'c :Files $HOME/code/miku<CR>
nnoremap 'g :Files $HOME/go/src<CR>
nnoremap 's :Files /usr/local/go/src<CR>

set undofile
set undodir=~/.vim/undodir

" augroup autoformat_settings
"   autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType python AutoFormatBuffer yapf
"   autocmd FileType rust AutoFormatBuffer rustfmt
" augroup END
"

set nofoldenable    " disable folding
