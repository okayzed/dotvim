" Name:         taqua2
" Description:  TaQua inspired colorscheme
" Author:       oky <okay.zed@gmail.com>
" Maintainer:   oky <okay.zed@gmail.com>
" License:      Public domain
" Last Updated: Sun 25 Aug 2019 07:30:11 PM PDT

" Generated by Colortemplate v2.0.0

set background=light

hi clear
if exists('syntax_on')
syntax reset
endif

let g:colors_name = 'taqua2'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (((&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')) && !has('iOS'))

hi! link QuickFixLine Search
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Debug Special
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor
hi! link vimCommand Statement
hi! link vimIsCommand Constant
hi! link vimMap PreProc

if (has('termguicolors') && &termguicolors) || has('gui_running')
let g:terminal_ansi_colors = ['#000000', '#ff0000', '#00ff00', '#ffff00',
    \ '#0000ff', '#ff00ff', '#00ffff', '#ebebeb', '#d2d2d2', '#ff6400',
    \ '#64ff00', '#ffff64', '#0064ff', '#ff64ff', '#64ffff', '#ffffff']
    if get(g:, 'taqua2_transp_bg', 0) && !has('gui_running')
    hi Normal guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    else
    hi Normal guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Terminal guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    endif
    hi ColorColumn guifg=NONE guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Conceal guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Cursor guifg=#ebebeb guibg=#ebeb00 guisp=NONE gui=bold cterm=bold
    hi CursorColumn guifg=NONE guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
    hi CursorLine guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorLineNr guifg=#0000ff guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi DiffAdd guifg=#00ff00 guibg=#00ff00 guisp=NONE gui=reverse cterm=reverse
    hi DiffChange guifg=#000000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
    hi DiffDelete guifg=#ebebeb guibg=#ff0000 guisp=NONE gui=NONE cterm=NONE
    hi DiffText guifg=#ff0000 guibg=#ff0000 guisp=NONE gui=bold cterm=bold
    hi Directory guifg=#000000 guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi EndOfBuffer guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi ErrorMsg guifg=#ebebeb guibg=#ff0000 guisp=NONE gui=bold cterm=bold
    hi FoldColumn guifg=#00ffff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Folded guifg=#00ffff guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi IncSearch guifg=#ffff64 guibg=#ffff00 guisp=NONE gui=bold cterm=bold
    hi LineNr guifg=#0000ff guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi MatchParen guifg=#00ffff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi ModeMsg guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
    hi MoreMsg guifg=NONE guibg=#00ff00 guisp=NONE gui=bold cterm=bold
    hi NonText guifg=#000000 guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi Pmenu guifg=#000000 guibg=#ff00ff guisp=NONE gui=NONE cterm=NONE
    hi PmenuSbar guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi PmenuSel guifg=#000000 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi PmenuThumb guifg=#000000 guibg=#000000 guisp=NONE gui=NONE cterm=NONE
    hi Question guifg=#0000ff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Search guifg=#ffff64 guibg=#ffff00 guisp=NONE gui=bold cterm=bold
    hi SignColumn guifg=#0000ff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi SpecialKey guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi SpellBad guifg=#000000 guibg=#ebebeb guisp=#ff0000 gui=NONE cterm=NONE
    hi SpellCap guifg=#000000 guibg=#ebebeb guisp=#0000ff gui=NONE cterm=NONE
    hi SpellLocal guifg=#000000 guibg=#ebebeb guisp=#ff00ff gui=NONE cterm=NONE
    hi SpellRare guifg=#000000 guibg=#ebebeb guisp=#00ffff gui=reverse cterm=reverse
    hi StatusLine guifg=#ebebeb guibg=#00ffff guisp=NONE gui=bold cterm=bold
    hi StatusLineNC guifg=#ebebeb guibg=#000000 guisp=NONE gui=bold cterm=bold
    hi TabLineSel guifg=#000000 guibg=#ebebeb guisp=NONE gui=underline cterm=underline
    hi TabLineFill guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
    hi TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Title guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi VertSplit guifg=#ebebeb guibg=#000000 guisp=NONE gui=bold cterm=bold
    hi Visual guifg=#ebebeb guibg=#0000ff guisp=NONE gui=bold cterm=bold
    hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=bold,underline ctermfg=NONE ctermbg=NONE cterm=bold,underline
    hi WarningMsg guifg=#00ff00 guibg=#ffff00 guisp=NONE gui=bold cterm=bold
    hi WildMenu guifg=#ff00ff guibg=#000000 guisp=NONE gui=standout cterm=standout
    hi Comment guifg=#00ffff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Constant guifg=#ebeb00 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Error guifg=#ff0000 guibg=#ebebeb guisp=NONE gui=reverse cterm=reverse
    hi Identifier guifg=#ebeb00 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi Ignore guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi PreProc guifg=#00ff00 guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi Special guifg=#00ffff guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi Statement guifg=#ff64ff guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi Todo guifg=#ff00ff guibg=#ff00ff guisp=NONE gui=NONE cterm=NONE
    hi Type guifg=#0000ff guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi Underlined guifg=#ebeb00 guibg=NONE guisp=NONE gui=underline cterm=underline
    hi CursorIM guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi ToolbarLine guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
    hi ToolbarButton guifg=#ebebeb guibg=#ebebeb guisp=NONE gui=bold cterm=bold
    hi htmlH1 guifg=NONE guibg=#ff00ff guisp=NONE gui=bold cterm=bold
    hi htmlH2 guifg=NONE guibg=#ebeb00 guisp=NONE gui=bold cterm=bold
    hi htmlH3 guifg=NONE guibg=#ffff00 guisp=NONE gui=bold cterm=bold
    hi htmlH4 guifg=NONE guibg=#00ff00 guisp=NONE gui=bold cterm=bold
    hi htmlH5 guifg=NONE guibg=#0000ff guisp=NONE gui=bold cterm=bold
    unlet s:t_Co s:italics
    finish
    endif

    if s:t_Co >= 256
    if get(g:, 'taqua2_transp_bg', 0)
    hi Normal ctermfg=235 ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=235 ctermbg=NONE cterm=NONE
    else
    hi Normal ctermfg=235 ctermbg=15 cterm=NONE
    hi Terminal ctermfg=235 ctermbg=15 cterm=NONE
    endif
    hi ColorColumn ctermfg=NONE ctermbg=255 cterm=NONE
    hi Conceal ctermfg=224 ctermbg=242 cterm=NONE
    hi Cursor ctermfg=15 ctermbg=16 cterm=bold
    hi CursorColumn ctermfg=NONE ctermbg=255 cterm=reverse
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorLineNr ctermfg=39 ctermbg=15 cterm=bold
    hi DiffAdd ctermfg=34 ctermbg=46 cterm=reverse
    hi DiffChange ctermfg=235 ctermbg=15 cterm=reverse
    hi DiffDelete ctermfg=15 ctermbg=196 cterm=NONE
    hi DiffText ctermfg=196 ctermbg=224 cterm=bold
    hi Directory ctermfg=24 ctermbg=15 cterm=bold
    hi EndOfBuffer ctermfg=235 ctermbg=15 cterm=NONE
    hi ErrorMsg ctermfg=15 ctermbg=224 cterm=bold
    hi FoldColumn ctermfg=32 ctermbg=195 cterm=NONE
    hi Folded ctermfg=32 ctermbg=195 cterm=bold
    hi IncSearch ctermfg=28 ctermbg=190 cterm=bold
    hi LineNr ctermfg=39 ctermbg=195 cterm=bold
    hi MatchParen ctermfg=32 ctermbg=195 cterm=NONE
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=NONE ctermbg=34 cterm=bold
    hi NonText ctermfg=30 ctermbg=15 cterm=bold
    hi Pmenu ctermfg=235 ctermbg=225 cterm=NONE
    hi PmenuSbar ctermfg=235 ctermbg=224 cterm=NONE
    hi PmenuSel ctermfg=235 ctermbg=255 cterm=NONE
    hi PmenuThumb ctermfg=235 ctermbg=235 cterm=NONE
    hi Question ctermfg=39 ctermbg=15 cterm=NONE
    hi Search ctermfg=28 ctermbg=190 cterm=bold
    hi SignColumn ctermfg=39 ctermbg=224 cterm=NONE
    hi SpecialKey ctermfg=224 ctermbg=255 cterm=bold
    hi SpellBad ctermfg=235 ctermbg=15 cterm=NONE
    hi SpellCap ctermfg=235 ctermbg=15 cterm=NONE
    hi SpellLocal ctermfg=235 ctermbg=15 cterm=NONE
    hi SpellRare ctermfg=235 ctermbg=15 cterm=reverse
    hi StatusLine ctermfg=15 ctermbg=32 cterm=bold
    hi StatusLineNC ctermfg=15 ctermbg=24 cterm=bold
    hi TabLineSel ctermfg=235 ctermbg=224 cterm=underline
    hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=bold
    hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Title ctermfg=242 ctermbg=15 cterm=bold
    hi VertSplit ctermfg=15 ctermbg=24 cterm=bold
    hi Visual ctermfg=15 ctermbg=39 cterm=bold
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=bold,underline
    hi WarningMsg ctermfg=34 ctermbg=190 cterm=bold
    hi WildMenu ctermfg=225 ctermbg=235 cterm=standout
    hi Comment ctermfg=32 ctermbg=195 cterm=NONE
    hi Constant ctermfg=16 ctermbg=195 cterm=NONE
    hi Error ctermfg=196 ctermbg=15 cterm=reverse
    hi Identifier ctermfg=16 ctermbg=NONE cterm=bold
    hi Ignore ctermfg=224 ctermbg=255 cterm=NONE
    hi PreProc ctermfg=34 ctermbg=15 cterm=bold
    hi Special ctermfg=32 ctermbg=195 cterm=NONE
    hi Statement ctermfg=206 ctermbg=15 cterm=bold
    hi Todo ctermfg=197 ctermbg=225 cterm=NONE
    hi Type ctermfg=39 ctermbg=15 cterm=bold
    hi Underlined ctermfg=16 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=224 ctermbg=255 cterm=NONE
    hi ToolbarLine ctermfg=242 ctermbg=255 cterm=NONE
    hi ToolbarButton ctermfg=255 ctermbg=242 cterm=bold
    hi htmlH1 ctermfg=NONE ctermbg=196 cterm=bold
    hi htmlH2 ctermfg=NONE ctermbg=16 cterm=bold
    hi htmlH3 ctermfg=NONE ctermbg=190 cterm=bold
    hi htmlH4 ctermfg=NONE ctermbg=34 cterm=bold
    hi htmlH5 ctermfg=NONE ctermbg=39 cterm=bold
    unlet s:t_Co s:italics
    finish
    endif

    if s:t_Co >= 8
    if get(g:, 'taqua2_transp_bg', 0)
    hi Normal ctermfg=Black ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=Black ctermbg=NONE cterm=NONE
    else
    hi Normal ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi Terminal ctermfg=Black ctermbg=LightGrey cterm=NONE
    endif
    hi ColorColumn ctermfg=NONE ctermbg=LightGrey cterm=NONE
    hi Conceal ctermfg=Gray ctermbg=Gray cterm=NONE
    hi Cursor ctermfg=LightGrey ctermbg=DarkYellow cterm=bold
    hi CursorColumn ctermfg=NONE ctermbg=LightGrey cterm=reverse
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorLineNr ctermfg=DarkBlue ctermbg=LightGrey cterm=bold
    hi DiffAdd ctermfg=Green ctermbg=DarkGreen cterm=reverse
    hi DiffChange ctermfg=Black ctermbg=LightGrey cterm=reverse
    hi DiffDelete ctermfg=LightGrey ctermbg=DarkRed cterm=NONE
    hi DiffText ctermfg=DarkRed ctermbg=LightRed cterm=bold
    hi Directory ctermfg=DarkGray ctermbg=LightGrey cterm=bold
    hi EndOfBuffer ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi ErrorMsg ctermfg=LightGrey ctermbg=LightRed cterm=bold
    hi FoldColumn ctermfg=DarkCyan ctermbg=LightBlue cterm=NONE
    hi Folded ctermfg=DarkCyan ctermbg=LightBlue cterm=bold
    hi IncSearch ctermfg=LightYellow ctermbg=DarkYellow cterm=bold
    hi LineNr ctermfg=DarkBlue ctermbg=LightBlue cterm=bold
    hi MatchParen ctermfg=DarkCyan ctermbg=LightBlue cterm=NONE
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=NONE ctermbg=Green cterm=bold
    hi NonText ctermfg=Cyan ctermbg=LightGrey cterm=bold
    hi Pmenu ctermfg=Black ctermbg=LightMagenta cterm=NONE
    hi PmenuSbar ctermfg=Black ctermbg=Gray cterm=NONE
    hi PmenuSel ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi PmenuThumb ctermfg=Black ctermbg=Black cterm=NONE
    hi Question ctermfg=DarkBlue ctermbg=LightGrey cterm=NONE
    hi Search ctermfg=LightYellow ctermbg=DarkYellow cterm=bold
    hi SignColumn ctermfg=DarkBlue ctermbg=Gray cterm=NONE
    hi SpecialKey ctermfg=Gray ctermbg=LightGrey cterm=bold
    hi SpellBad ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi SpellCap ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi SpellLocal ctermfg=Black ctermbg=LightGrey cterm=NONE
    hi SpellRare ctermfg=Black ctermbg=LightGrey cterm=reverse
    hi StatusLine ctermfg=LightGrey ctermbg=DarkCyan cterm=bold
    hi StatusLineNC ctermfg=LightGrey ctermbg=DarkGray cterm=bold
    hi TabLineSel ctermfg=Black ctermbg=Gray cterm=underline
    hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=bold
    hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Title ctermfg=Gray ctermbg=LightGrey cterm=bold
    hi VertSplit ctermfg=LightGrey ctermbg=DarkGray cterm=bold
    hi Visual ctermfg=LightGrey ctermbg=DarkBlue cterm=bold
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=bold,underline
    hi WarningMsg ctermfg=Green ctermbg=DarkYellow cterm=bold
    hi WildMenu ctermfg=LightMagenta ctermbg=Black cterm=standout
    hi Comment ctermfg=DarkCyan ctermbg=LightBlue cterm=NONE
    hi Constant ctermfg=DarkYellow ctermbg=LightBlue cterm=NONE
    hi Error ctermfg=DarkRed ctermbg=LightGrey cterm=reverse
    hi Identifier ctermfg=DarkYellow ctermbg=NONE cterm=bold
    hi Ignore ctermfg=Gray ctermbg=LightGrey cterm=NONE
    hi PreProc ctermfg=Green ctermbg=LightGrey cterm=bold
    hi Special ctermfg=DarkCyan ctermbg=LightBlue cterm=NONE
    hi Statement ctermfg=LightMagenta ctermbg=LightGrey cterm=bold
    hi Todo ctermfg=DarkMagenta ctermbg=LightMagenta cterm=NONE
    hi Type ctermfg=DarkBlue ctermbg=LightGrey cterm=bold
    hi Underlined ctermfg=DarkYellow ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=Gray ctermbg=LightGrey cterm=NONE
    hi ToolbarLine ctermfg=Gray ctermbg=LightGrey cterm=NONE
    hi ToolbarButton ctermfg=LightGrey ctermbg=Gray cterm=bold
    hi htmlH1 ctermfg=NONE ctermbg=DarkMagenta cterm=bold
    hi htmlH2 ctermfg=NONE ctermbg=DarkYellow cterm=bold
    hi htmlH3 ctermfg=NONE ctermbg=DarkYellow cterm=bold
    hi htmlH4 ctermfg=NONE ctermbg=Green cterm=bold
    hi htmlH5 ctermfg=NONE ctermbg=DarkBlue cterm=bold
    unlet s:t_Co s:italics
    finish
    endif

    if s:t_Co >= 2
    hi Normal term=NONE
    hi ColorColumn term=reverse
    hi Conceal term=NONE
    hi Cursor term=NONE
    hi CursorColumn term=reverse
    hi CursorLine term=underline
    hi CursorLineNr term=bold,italic,reverse,underline
    hi DiffAdd term=reverse,underline
    hi DiffChange term=reverse,underline
    hi DiffDelete term=reverse,underline
    hi DiffText term=bold,reverse,underline
    hi Directory term=NONE
    hi EndOfBuffer term=NONE
    hi ErrorMsg term=bold,italic,reverse
    hi FoldColumn term=reverse
    hi Folded term=italic,reverse,underline
    hi IncSearch term=bold,italic,reverse
    hi LineNr term=reverse
    hi MatchParen term=bold,underline
    hi ModeMsg term=NONE
    hi MoreMsg term=NONE
    hi NonText term=NONE
    hi Pmenu term=reverse
    hi PmenuSbar term=NONE
    hi PmenuSel term=NONE
    hi PmenuThumb term=NONE
    hi Question term=standout
    hi Search term=italic,underline
    hi SignColumn term=reverse
    hi SpecialKey term=bold
    hi SpellBad term=italic,underline
    hi SpellCap term=italic,underline
    hi SpellLocal term=italic,underline
    hi SpellRare term=italic,underline
    hi StatusLine term=bold,reverse
    hi StatusLineNC term=reverse
    hi TabLine term=italic,reverse,underline
    hi TabLineFill term=reverse,underline
    hi TabLineSel term=bold
    hi Title term=bold
    hi VertSplit term=reverse
    hi Visual term=reverse
    hi VisualNOS term=NONE
    hi WarningMsg term=standout
    hi WildMenu term=bold
    hi Comment term=italic
    hi Constant term=bold,italic
    hi Error term=reverse
    hi Identifier term=italic
    hi Ignore term=NONE
    hi PreProc term=italic
    hi Special term=bold,italic
    hi Statement term=bold
    hi Todo term=bold,underline
    hi Type term=bold
    hi Underlined term=underline
    hi CursorIM term=NONE
    hi ToolbarLine term=reverse
    hi ToolbarButton term=bold,reverse
    if !s:italics
    hi CursorLineNr term=bold,reverse,underline
    hi ErrorMsg term=bold,reverse
    hi Folded term=reverse,underline
    hi IncSearch term=bold,reverse
    hi Search term=underline
    hi SpellBad term=underline
    hi SpellCap term=underline
    hi SpellLocal term=underline
    hi SpellRare term=underline
    hi TabLine term=reverse,underline
    hi Comment term=NONE
    hi Constant term=bold
    hi Identifier term=NONE
    hi PreProc term=NONE
    hi Special term=bold
    endif
    unlet s:t_Co s:italics
    finish
    endif

    " Background: light
    " Color: black         #000000                   235       Black
    " Color: red           rgb(255,   0,   0)        196       DarkRed
    " Color: lightred      rgb(255,   0,   0)        224       LightRed
    " Color: green         rgb(  0, 255,   0)        34        Green
    " Color: lightgreen    rgb(  0, 255,   0)        46        DarkGreen
    " Color: yellow        rgb(255, 255,   0)        190       DarkYellow
    " Color: blue          rgb(  0,   0, 255)        39        DarkBlue
    " Color: magenta       rgb(255,   0, 255)        196       DarkMagenta
    " Color: darkmagenta   rgb(255,   0, 255)        197       DarkMagenta
    " Color: lightmagenta  rgb(255,   0, 255)        225       LightMagenta
    " Color: cyan          rgb(  0, 255, 255)        32        DarkCyan
    " Color: white         rgb(235, 235, 235)        15        LightGrey
    " Color: gray          rgb(235, 235, 235)        224       Gray
    " Color: lightgray     rgb(235, 235, 235)        255         LightGrey
    " Color: darkgray      rgb(235, 235, 235)        242       Gray
    " Color: orange        rgb(235, 235, 0)          16        DarkYellow
    " Color: lightblue     rgb(235, 235, 235)        195       LightBlue
    " Color: brightblack   rgb(210, 210, 210)        231       DarkGrey
    " Color: brightred     rgb(255, 100,   0)        196       LightRed
    " Color: brightgreen   rgb(100, 255,   0)        15        LightGreen
    " Color: brightyellow  rgb(255, 255, 100)        28        LightYellow
    " Color: brightblue    rgb(  0, 100, 255)        231       LightBlue
    " Color: brightmagenta rgb(255, 100, 255)        206       LightMagenta
    " Color: brightcyan    rgb(100, 255, 255)        ~         LightCyan
    " Color: bluegray      rgb(0, 0, 0)              24        DarkGray
    " Color: teal          rgb(0, 0, 0)              30        Cyan
    " Color: brightwhite   #ffffff                  231        White
    " Term colors: black red green yellow blue magenta cyan white
    " Term colors: brightblack brightred brightgreen brightyellow
    " Term colors: brightblue brightmagenta brightcyan brightwhite
    " vim: et ts=2 sw=2