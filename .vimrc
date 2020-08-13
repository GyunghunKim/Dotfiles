map <F3> :NERDTreeToggle<cr>

filetype plugin on

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
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
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

"instant-markdown"
let g:instant_markdown_browser = "firefox --new-window"

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
