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


" set the color scheme
colorscheme PaperColor
set background=dark
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
" IRB {{{
autocmd FileType irb inoremap <buffer> <CR> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<CR>
nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i
" }}}
" PLUGIN SETTINGS {{{
" Finding function in python. Pretty nifty.
python << EOL
import vim

def Finder(*args):
    ''' Operation is as follows:
        - request the starting dir
        - find command finds the requested file
        - the printf param formats it to accomodate the errorformat '%f:%l:%m'
        - line is always 1, message is empty (-)
        - the 'cgete' vim command puts it into the quickfix errorlist
        - 'botright copen' opens the quickfix list
    '''
    start_dir = vim.eval('getcwd()')
    find_cmd = (r'find %s -name %s -printf %%p:1:-\\n' % (start_dir, args[0]))
    vim.command("cgete system('%s')" % find_cmd)
    vim.command('botright copen')
EOL
command! -nargs=1 Find :py Finder("<args>")
map <Leader>f :Find

" Latex-Suite Options

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

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

" undo branch viewer
map <Leader>u :UndoBranchViewer<CR>
" rails.vim options
" let g:rails_statusline=0

" Vimspell options
let spell_root_menu="-"
let spell_executable="aspell"
let mapleader = "\\"

" gundo toggle bindings
nnoremap <LocalLeader>u :GundoToggle<CR>

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" buf explorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.


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
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow


au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.coffee set filetype=coffee

set suffixesadd+=.js
set path+=**
set cinoptions=cino-l
" }}}
"
" vim: foldmethod=marker
