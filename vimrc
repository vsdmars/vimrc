" Author: vsdmars vsdmars@gmail.com

set nocompatible        " not compatible with the old-fashion vi mode
set hidden              " set buffer hidden
set exrc
set secure

" set leader to ,
let mapleader=","
let g:mapleader=","

" g:my_vim_dir is used elsewhere in this vim configurations
let g:my_vim_dir=expand("$HOME/.vim")
let g:hostname = substitute(system('hostname'), "\n", "", "")

source $HOME/.vim/layer/all-packages.vim

" https://vi.stackexchange.com/a/10125
" Same as:
" filetype on
" filetype plugin on
" filetype indent on
filetype plugin indent on
