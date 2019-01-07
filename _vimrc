"
" author:  guozhenyi
" version: 0.1
" create at: 2019-01-07
"

"win
winpos 520 220   "left top
set lines=30 columns=120

" base
set nocompatible

set encoding=utf-8
set langmenu=en_US.utf-8  "zh_CN.utf-8
lang mes en_US.utf-8   "zh_CN.utf-8


colorscheme desert
colo peachpuff
set autoindent
set nu


"用空格键来开关折叠（说明西方"后面的内容为注释，不会被VIM所识别）
set foldenable
set foldmethod=indent
nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')


"插件管理
set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
call vundle#end()
filetype plugin indent on

"Toggle Menu and Toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

