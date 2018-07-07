set nocompatible

" Pathogen initializer {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}
" UI OPTIONS {{{
set t_Co=256

" Gui Options
if has("gui_running")
        set guioptions-=e "get rid of tabs
        set guioptions-=T "get rid of toolbar
        set guioptions-=r "get rid of right scrollbar
        set guioptions-=l "get rid of left scrollbar
        set guifont=Liberation\ Mono\ 10
endif

set guicursor=

" set the color scheme
let &background=$BACKGROUND
colorscheme PaperColor
" }}}
" GENERAL OPTIONS {{{
" Short Messages - Don't give me that file already being edited nonsense
set shortmess+=A
" Switch between buffers without saving the buffer first
set hidden
"Itch that bufferscratching itch with jumping around.
set switchbuf=useopen
" Search settings
set showmatch
set incsearch
set grepprg=ack-grep\ --column\ $*
" Tabbing settings
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=4
set tabstop=2
" wild menu
set wildmenu
set completeopt=longest,menuone,preview

" default to using marker folds
set foldmethod=marker

" show me the command!
set showcmd

" Turn off mouse abilities
set mouse=

" Display whitespace
" Display statusline always
" taken from http://techspeak.plainlystated.com/2009/05/vim-statusline.html

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%f\                       " relative path
set statusline+=%m                        " modifiable flag
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%2*[%n]%*\                " buffer number, and flags
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10((%v,%l)%)\            " line and column
set statusline+=%P                        " percentage of file

" Cscope options
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev csh cs help
  cnoreabbrev csss cs show

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" Omnicompletion ahoy
filetype plugin on
set ofu=syntaxcomplete#Complete

set thesaurus+=~/.vim/mthesaur.txt

" }}}
" MAPPINGS {{{
let mapleader = "\\"
let maplocalleader = "["

" lhs comments (line commenting)
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>
" wrapping comments (line commenting)
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>
" [okay] commenting
map ,[ 0/$:nohlsearch<CR>a [okay]
" a grep mapping - doesn't add * to the end because it will search all files
" in cur directory, and ack-grep is smart enough to know that.
map <Leader>g :grep <cword>
map <Leader>cc :source ~/.vimrc<CR>
nmap [g :cp
nmap ]g :cn
nmap [t :tp
nmap ]t :tn

:nnoremap <silent> xw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" toggle paste mode
map <F2> :set paste!<CR>
" no highlighting after search with F3
map <F3> :nohlsearch<CR>
" build on f4
map <F4> :make<CR>

map <F5> :SyntasticCheck<CR>

let g:syntastic_shell = "/bin/bash"

" highlight class of character under the word
nmap <silent> <F10>   :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map gn :e <cfile><CR>

nmap gr :exec ":silent !xdg-open ".expand("<cWORD>")
" Set gp to select the last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" trim ending whitespace
map <Leader>tr :%s/\s\+$//g
" paste input toggle
set pastetoggle=<F2>
" }}}
" PLUGIN SETTINGS {{{
" Latex-Suite Options

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set ttimeoutlen=50

" Remove the Math menu from Latex-Suite
let g:Tex_MathMenus=0
let g:Tex_ViewRule_pdf='xdg-open'
let g:Tex_DefaultTargetFormat='pdf'


" Tagbar Options
" explicitly set our st plugin with F8
nnoremap <silent> <F8> :Tagbar<CR>
let Tlist_Show_One_File = 1
let g:tagbar_left = 0


" NERDTree
noremap <F9> :NERDTreeToggle
let NERDTreeWinPos="right"

" Vimspell options
let spell_root_menu="-"
let spell_executable="aspell"

" gundo toggle bindings
nnoremap <LocalLeader>u :GundoToggle<CR>

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_disabled_filetypes=['html', 'js']


" buf explorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.

" vim-R
" __ turns into <--
let R_assign=2

" }}}
" {{{  HIGHLIGHTING OPTIONS
highlight clear Error
highlight clear Spellbad
highlight link Spellbad javascriptDebug
highlight link Error javascriptDebug
" }}}
" {{{ FILETYPE OPTIONS
" go stuff
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.coffee set filetype=coffee

set suffixesadd+=.js
set path+=**
set cinoptions=cino-l

let g:syntastic_javascript_checkers = ['jshint']

" }}}
"
" vim: foldmethod=marker
