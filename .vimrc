map <F3> :NERDTreeToggle<cr>

filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'suan/vim-instant-markdown'
call vundle#end()

"vimtex start
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"vimtex end

"ultisnips start"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"ultisnips end"

"colorscheme"
colorscheme wal

syntax on
set autoindent
set nu
set ruler
set autochdir

set ts=4
set expandtab
set shiftwidth=4
set textwidth=80

set fileencodings=utf8,euc-kr

map <F3> :NERDTreeToggle<cr>
