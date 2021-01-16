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
Plugin 'ycm-core/YouCompleteMe'
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
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
"ultisnips end"

"vim-instant-markdown start"
let g:instant_markdown_mathjax = 1
let g:instant_markdown_browser = "firefox --new-window"
"vim-instant-markdown end"

"Youcompleteme start"
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']

"let g:ycm_semantic_triggers = {
"	\   'C': [ 're!\w{2}' ]
"	\ }
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_filetype_blacklist = {}

nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <C-]> :YcmCompleter GoTo<CR>
"Youcompleteme end"

"NERDTree start"
map <F3> :NERDTreeToggle<cr>
"NERDTree end"

"colorscheme"
colorscheme wal

syntax on
set autoindent
set smartindent
set cindent
set nu
set ruler
set autochdir

set ts=4
set expandtab
set shiftwidth=4
set textwidth=80
set updatetime=300 "For the hover in ycm

set fileencodings=utf8,euc-kr
