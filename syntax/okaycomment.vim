" Vim syntax file
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

"Although there are few non-symbol characters in this syntax, there isn't
"any reason for it to be case-sensitive.
syntax case ignore

syn region fileName start="^\*" end="*"
syn region linePref start="^\s\+\d\+" end=":"he=e-1
syn region folder start="{"he=e+1 end="}"hs=s-1 fold transparent

syn match commenter /\[okay\]/

hi def link linePref constant
hi def link commenter comment
hi def link fileName statement

let b:current_syntax = "okay"
set foldmethod=syntax
set foldtext=getline(v:foldstart+1)
