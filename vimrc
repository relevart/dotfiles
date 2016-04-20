set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-fswitch'

call vundle#end()            
filetype plugin indent on   

syntax on

set hidden
set wildmenu
set showcmd
set hlsearch
set incsearch

set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set shiftwidth=4
set softtabstop=4
set expandtab

set ruler
set laststatus=2

set confirm
set visualbell
set t_vb=
" set mouse=c
set mouse=a
set cmdheight=2

set number

set notimeout ttimeout ttimeoutlen=200

map Y y$

" if has('gui_running')
" " set font to Consolas 10 by default
" " set guifont=Consolas:h10:cANSI
" " set color scheme to candy by default
" colorscheme candy
" endif

" set cc=80
" set wrapmargin=80
set tags=./tags;/

let g:ycm_confirm_extra_conf=0

nmap <F8> :TagbarToggle<CR>

nmap <F4> :FSHere<CR> 
" nmap <F4> :FSSplitLeft<CR>
