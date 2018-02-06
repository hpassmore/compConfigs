execute pathogen#infect()

syntax on
filetype plugin indent on
set backspace=2
set tabstop=4
set shiftwidth=4 
set expandtab
set number

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
