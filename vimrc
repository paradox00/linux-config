syntax on
set mouse=a
set number
set nocompatible

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
"set cindent
"set cino=L,:0,b1,t0,(s,U1,m1
set smartindent

set nowrap
set showcmd
set showmatch

set autowrite
set hidden

set equalalways

set ignorecase
set smartcase
set incsearch
set hls

set splitbelow
set splitright

set statusline=\[%n\]\ \%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

set undofile
set undodir=~/.vimundo

"enable 256 colors schemes
if has('unix')
	set t_Co=256
endif

colorscheme desert

" Python configs
filetype indent plugin on
set modeline

command W w !sudo tee % > /dev/null

map <Leader>tt :tabnew<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr> 
map <C-Tab> <C-w>
map <Leader>c  :noh<cr>
noh

" nnoremap <C-l> :noh<cr>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'L9'
Plugin 'fuzzyfinder'
Plugin 'davidhalter/jedi-vim'

call vundle#end() 
filetype plugin indent on

func Cscope_load()
    !cscope -b -R -q
    cs reset
endfunc

map <F1> :NERDTree<cr>
nmap <F3> :FufFileWithFullCwd<cr>

nmap <F12> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F11> :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-F9> :call Cscope_load()<cr><cr>


