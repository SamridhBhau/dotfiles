set nocompatible
filetype plugin on
syntax on

let mapleader = ' '
call plug#begin()
Plug 'vimwiki/vimwiki'
call plug#end()


let g:vimwiki_list = [{'path': '~/Documents/vimwiki',
                      \ 'syntax': 'markdown', 'ext': 'md'}]


