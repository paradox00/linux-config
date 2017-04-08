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
set cino=(0

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
highlight PmenuSel ctermfg=1 ctermbg=4
highlight Pmenu ctermfg=7 ctermbg=4

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
set pastetoggle=<F2>
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
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-utils/vim-man'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'

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

filetype plugin indent on

func! Cscope_load()
    !cscope-indexer -r .
    cs reset
endfunc

map <F8> :NERDTreeToggle<cr>
nmap <F9> :FufFile<cr>

nmap <F12> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F11> :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F10> :call Cscope_load()<cr><cr>

" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.
"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split vertically, with search result displayed in
" the new window.
nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" Jedi options
let g:jedi#use_splits_not_buffers = "right"

