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
" indention options
set cino=(0
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

" always show status line
set laststatus=2

set fileformats=unix,dos "hide ^M in files with inconsistent EOL

"enable current dir .vimrc
set exrc 

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

command! W w !sudo tee % > /dev/null

map <Leader>tt :tabnew<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr> 
map <C-Tab> <C-w>
map <Leader>c  :noh<cr>
set pastetoggle=<Leader>p
noh

" nnoremap <C-l> :noh<cr>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'L9'
Plugin 'fuzzyfinder'
Plugin 'davidhalter/jedi-vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tpope/vim-fugitive'
Plugin 'will133/vim-dirdiff'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'ericpruitt/tmux.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'nginx.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-commentary' " provides gcc, gc command to comment toggle 

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'gnuplot.vim'

call vundle#end() 

"enable man plugin
runtime! ftplugin/man.vim

if has("autocmd")
  autocmd FileType c setlocal cindent expandtab sw=4 ts=4
  autocmd FileType cpp setlocal cindent expandtab sw=4 ts=4
  autocmd FileType sh setlocal expandtab sw=4
  autocmd FileType c,cpp setlocal foldmethod=syntax
  autocmd FileType c,cpp normal zR

  autocmd BufNewFile,BufRead *.h    setfiletype c

  au BufRead,BufNewFile trc.* setfiletype siotrace
  au FileType siotrace highlight Timestamp guibg=Blue ctermfg=Blue
  au FileType siotrace syn match Timestamp "^\d\{2}/\d\{2} \d\{2}:\d\{2}:\d\{2}.\d\{6}"
  au FileType siotrace highlight ProcessStart guibg=Green guifg=Black ctermbg=Green ctermfg=Black
  au FileType siotrace syn match ProcessStart " ---------- Process started.*"
  au FileType siotrace highlight EventLog guifg=Green
  au FileType siotrace syn match EventLog "mosEventLog.*"
  au FileType siotrace highlight Panic guibg=Red guifg=Yellow ctermfg=Yellow
  au FileType siotrace syn match Panic "Panic .*"

  " enable nginx filetype
  au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
endif

filetype plugin indent on

func! Cscope_load()
    !cscope-indexer -r .
    cs reset
endfunc


map <F5> :make less<cr>:cw<cr>
map <F8> :NERDTreeToggle<cr>
map <F9> :FufFile<cr>
map <F10> :call Cscope_load()<cr><cr>
map <F11> :vert scs find s <C-R>=expand("<cword>")<CR><CR>
map <F12> :cs find s <C-R>=expand("<cword>")<CR><CR>

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

" Enable ag command
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev ag Ack

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set filetype=%s  ts=%d sw=%d tw=%d %set :",
        \ &filetype,
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" vim: set filetype=vim  ts=4 sw=4 tw=78 et :
