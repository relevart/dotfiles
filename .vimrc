
set t_Co=256

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bogado/file-line'

call vundle#end()

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
set cc=101

map Y y$

" if has('gui_running')
" " set font to Consolas 10 by default
" " set guifont=Consolas:h10:cANSI
" " set color scheme to candy by default
" colorscheme candy
" endif

" let s:cc_on = 0
" function! ToggleColorColumn()
"     if s:cc_on == 0
"         set cc=81
"         let s:cc_on = 1
"     else
"         set cc=
"         let s:cc_on = 0
"     endif
" endfunction
" nmap <F7> :ToggleColorColumn<CR>

" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" let &colorcolumn="81,".join(range(121,999),",")
" set colorcolumn=81
" hi ColorColumn ctermbg=darkblue ctermfg=lightgrey
" hi ColorColumn ctermbg=darkgreen ctermfg=lightgrey
" hi ColorColumn ctermbg=darkcyan ctermfg=lightgrey
" hi ColorColumn ctermbg=darkred ctermfg=lightgrey
" hi ColorColumn ctermbg=darkmagenta ctermfg=lightgrey
" highlight hl-ColorColumn ctermbg=darkgrey ctermfg=lightgrey
" highlight OverLength ctermbg=darkred ctermfg=white
" match OverLength /\%>80v.\+/
" set wrapmargin=80

set tags=./tags;/

let g:ycm_confirm_extra_conf=0

vnoremap // y/<C-R>"<CR>
" use // to search for visually selected text

" color peachpuff
" set background=dark
" colorscheme solarized
" set background=black

"							*cterm-colors*
"	    NR-16   NR-8    COLOR NAME ~
"	    0	    0	    Black
"	    1	    4	    DarkBlue
"	    2	    2	    DarkGreen
"	    3	    6	    DarkCyan
"	    4	    1	    DarkRed
"	    5	    5	    DarkMagenta
"	    6	    3	    Brown, DarkYellow
"	    7	    7	    LightGray, LightGrey, Gray, Grey
"	    8	    0*	    DarkGray, DarkGrey
"	    9	    4*	    Blue, LightBlue
"	    10	    2*	    Green, LightGreen
"	    11	    6*	    Cyan, LightCyan
"	    12	    1*	    Red, LightRed
"	    13	    5*	    Magenta, LightMagenta
"	    14	    3*	    Yellow, LightYellow
"	    15	    7*	    White
colorscheme desert
hi Search cterm=NONE ctermfg=black ctermbg=yellow
hi IncSearch cterm=NONE ctermfg=black ctermbg=yellow
" hi Visual cterm=reverse
hi Visual cterm=NONE ctermfg=black ctermbg=lightgray

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" let g:airline_theme='simple'
" let g:airline_theme='deus'
" let g:airline_theme='bubblegum'
" let g:airline_theme='minimalist'
let g:airline_theme='sol'

function! s:tagbar_integration()
endfunction

" cscope
source ~/.vim/cscope_maps.vim

function KernelTabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
    set list
    set listchars=tab:>-
    set cc=81
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set nolist
    set cc=
  endif
endfunction

" FUNCTION KEY REMAP

nmap <F1> :noh<CR>
" nnoremap <F1> :%s/\s\+$//g \| :noh<CR>

nmap <F4> :FSHere<CR>
" nmap <F4> :FSSplitLeft<CR>

nmap <F6> :cs find s <C-R>=expand("<cword>")<CR><CR>

nmap <F8> :TagbarToggle<CR>

nnoremap <F9> mz:%s/\s\+$//g<CR>'z

nmap <F10> mz:execute KernelTabToggle()<CR>'z

set scrolloff=5

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" remap window movement keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split to right and bottom
set splitbelow
set splitright

filetype plugin indent on
