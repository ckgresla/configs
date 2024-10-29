
"""
" Name: readability.vim
"""

set background=dark
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='readability'
set t_Co=256


" json

hi jsonNoise              guisp=NONE guifg=#F5C2E7 guibg=#1c1c1c ctermfg=218  gui=NONE cterm=NONE
hi jsonKeywordMatch       guisp=NONE guifg=#F5C2E7 guibg=#1c1c1c ctermfg=218  gui=NONE cterm=NONE
hi jsonKeyword            guisp=NONE guifg=#D9E0EE guibg=#1c1c1c ctermfg=254  gui=NONE cterm=NONE
hi jsonStringMatch        guisp=NONE guifg=#FAE3B0 guibg=#1c1c1c ctermfg=223  gui=NONE cterm=NONE
hi jsonString             guisp=NONE guifg=#ABE9B3 guibg=#1c1c1c ctermfg=151  gui=NONE cterm=NONE
hi jsonStringSQError      guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonEscape             guisp=NONE guifg=#FAE3B0 guibg=#1c1c1c ctermfg=223  gui=NONE cterm=NONE
hi jsonNumber             guisp=NONE guifg=#96CDFB guibg=#1c1c1c ctermfg=117  gui=NONE cterm=NONE
hi jsonNoQuotesError      guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonTripleQuotesError  guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonNumError           guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonCommentError       guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonSemicolonError     guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonTrailingCommaError guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonMissingCommaError  guisp=NONE guifg=#F28FAD guibg=#1c1c1c ctermfg=211  gui=NONE cterm=NONE
hi jsonPadding            guisp=NONE guifg=NONE    guibg=#1c1c1c ctermfg=NONE gui=NONE cterm=NONE
hi jsonBoolean            guisp=NONE guifg=#C9CBFF guibg=#1c1c1c ctermfg=189  gui=NONE cterm=NONE
hi jsonFold               guisp=NONE guifg=#6E6C7E guibg=#1c1c1c ctermfg=243  gui=NONE cterm=NONE
hi jsonTest               guisp=NONE guifg=NONE    guibg=#1c1c1c ctermfg=NONE gui=NONE cterm=NONE
hi jsonBraces             guisp=NONE guifg=#FAE3B0 guibg=#1c1c1c ctermfg=223  gui=NONE cterm=NONE
hi jsonNull               guisp=NONE guifg=#96CDFB guibg=#1c1c1c ctermfg=117  gui=NONE cterm=NONE
hi jsonQuote              guisp=NONE guifg=#FAE3B0 guibg=#1c1c1c ctermfg=223  gui=NONE cterm=NONE

" major

hi Normal     guisp=NONE guifg=#D9E0EE guibg=NONE ctermfg=254 ctermbg=NONE gui=NONE cterm=NONE
hi Comment    guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE
hi Constant   guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Statement  guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi PreProc    guisp=NONE guifg=#FAE3B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
hi Type       guisp=NONE guifg=#FAE2B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
hi Special    guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE
hi Underlined guisp=NONE guifg=#FAE3B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
hi Ignore     guisp=NONE guifg=#6E6C7E guibg=NONE ctermfg=243 ctermbg=NONE gui=NONE cterm=NONE
hi Error      guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi Todo       guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE

" minor

hi String         guisp=NONE guifg=#ABE9B3 guibg=NONE ctermfg=151 ctermbg=NONE gui=NONE cterm=NONE
hi Character      guisp=NONE guifg=#ABE9B3 guibg=NONE ctermfg=151 ctermbg=NONE gui=NONE cterm=NONE
hi Number         guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Boolean        guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE
hi Float          guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Function       guisp=NONE guifg=#FAE3B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
hi Conditional    guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi Repeat         guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi Label          guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE
hi Operator       guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Keyword        guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Exception      guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi Include        guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Define         guisp=NONE guifg=#ABE9B3 guibg=NONE ctermfg=151 ctermbg=NONE gui=NONE cterm=NONE
hi Macro          guisp=NONE guifg=#C9CBFF guibg=NONE ctermfg=189 ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit      guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass   guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Structure      guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi Typedef        guisp=NONE guifg=#96CDFB guibg=NONE ctermfg=117 ctermbg=NONE gui=NONE cterm=NONE
hi SpecialChar    guisp=NONE guifg=#F28FAD guibg=NONE ctermfg=211 ctermbg=NONE gui=NONE cterm=NONE
hi Tag            guisp=NONE guifg=#F5C2E7 guibg=NONE ctermfg=218 ctermbg=NONE gui=NONE cterm=NONE
hi Delimiter      guisp=NONE guifg=#FAE3B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guisp=NONE guifg=#ABE9B3 guibg=NONE ctermfg=151 ctermbg=NONE gui=NONE cterm=NONE
hi Debug          guisp=NONE guifg=#FAE3B0 guibg=NONE ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE




" Remapping the Default highlight colors, not nice to view w Catppuccin
hi clear SpellBad "mispelled words
hi SpellBad cterm=underline,bold ctermfg=Red
hi clear SpellRare "rare word, hardly ever used
hi SpellRare cterm=underline,bold ctermfg=DarkMagenta
hi clear SpellCap "word that should be capitalized
hi SpellCap cterm=underline,bold ctermfg=Yellow
hi clear SpellLocal "word that is recognized as being used in a diff region, other lang
hi SpellLocal cterm=underline,bold ctermfg=Blue

" CKG Customs -- stuff not configured in pinto but still want to keep
hi Search ctermfg=Black ctermbg=White "defaults to white, very painful to view w Pastel Catppuccin
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta 
	" color of matching paranethsis, good to change from other colors to see where a brace ought math
" hi Visual ctermbg=Magenta
	" sets the vim visual selection color to pink, ref-
	" https://stackoverflow.com/questions/3074068/how-to-change-the-color-of-the-selected-code-vim-scheme for more config stuff




