set nocompatible
filetype plugin on
syntax on

let mapleader = ' '
call plug#begin()
Plug 'junegunn/seoul256.vim'
call plug#end()

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=6

set clipboard^=unnamedplus
let g:seoul256_background = 233
colo seoul256
set background=dark
