set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SrcExpl'
Plugin 'taglist.vim'
Plugin 'AutoComplPop'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'

call vundle#end()

"vimtex start
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"vimtex end

syntax on
set autoindent
set smartindent
set nu
set ruler
set autochdir

set ts=4
set sts=4
set shiftwidth=4

set fileencodings=utf8,euc-kr

map <F3> :NERDTreeToggle<cr>
