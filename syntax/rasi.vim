" syntax/rasi.vim
" Rofi Advanced Style Information

" Syntax Guard {{{1
if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'rasi'
" }}}

" Syntax Definition: {{{1
syntax case match

syn region rasiString    start=+"+ end=+"+ oneline
syn match  rasiCharacter "L\='[^\\]'"

syn match rasiNumbersCom display contained transparent "\<\d\|\.\d" contains=rasiNumber,rasiFloat
syn match rasiNumber     display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match rasiNumber     display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match rasiFloat      display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match rasiFloat      display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match rasiFloat      display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match rasiFloat      display contained "\d\+e[-+]\=\d\+[fl]\=\>"

" Colors: {{{2
"hexadecimal colors
syn match rasiHexColor      display contained '#\x\{3,4}'
syn match rasiHexColor      display contained '#\x\{6}'
syn match rasiHexColor      display contained '#\x\{8}'
syn match rasiInvHexColor   display contained '#\x\{5}\X'he=e-1
syn match rasiInvHexColor   display contained '#\x\{7}\X'he=e-1
syn match rasiInvRGBColor   display contained 'rgb\(a\)\?([^)]*)'
syn match rasiRGBColor      display contained 'rgb(\s*\d\+\s*\(%\)\?\s*,\s*\d\+\s*\(%\)\?\s*,\s*\d\+\s*\(%\)\?\s*)'
syn match rasiRGBAColor     display contained 'rgba(\s*\d\+\s*\(%\)\?\s*,\s*\d\+\s*\(%\)\?\s*,\s*\d\+\s*\(%\)\?\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*)'
syn match rasiInvHSLColor   display contained 'h\(sl\|wb\)\(a\)\?([^)]*)'
syn match rasiHSLColor      display contained 'h\(sl\|wb\)(\s*\d\+\(\.\d*\)\?\(deg\|rad\|grad\|turn\)\?\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*)'
syn match rasiHSLAColor     display contained 'h\(sl\|wb\)a(\s*\d\+\(\.\d*\)\?\(deg\|rad\|grad\|turn\)\?\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*)'
syn match rasiInvCMYKColor  display contained 'cmyk([^)]*)'
"this match doesn't works properly (too long ?)
"syn match rasiCMYKColor     display contained 'cmyk(\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*\(,\s*\(\d\(\.\d*\)\?\|\d\{,3}%\)\s*\)\?)'

syn case ignore
syn keyword rasiNamedColor display contained
      \ AliceBlue AntiqueWhite Aqua Aquamarine Azure Beige Bisque Black BlanchedAlmond Blue
      \ BlueViolet Brown BurlyWood CadetBlue Chartreuse Chocolate Coral CornflowerBlue Cornsilk
      \ Crimson Cyan DarkBlue DarkCyan DarkGoldenRod DarkGray DarkGrey DarkGreen DarkKhaki DarkMagenta
      \ DarkOliveGreen DarkOrange DarkOrchid DarkRed DarkSalmon DarkSeaGreen Dark SlateBlue
      \ DarkSlateGray DarkSlateGrey DarkTurquoise DarkViolet DeepPink DeepSkyBlue DimGray DimGrey
      \ DodgerBlue FireBrick FloralWhite ForestGreen Fuchsia Gainsboro GhostWhite Gold GoldenRod
      \ Gray Grey Green GreenYellow HoneyDew HotPink IndianRed Indigo Ivory Khaki Lavender
      \ LavenderBlush LawnGreen LemonChiffon LightBlue LightCoral LightCyan LightGoldenRodYellow
      \ LightGray LightGrey LightGreen LightPink LightSalmon LightSeaGreen LightSkyBlue LightSlateGray
      \ LightSlateGrey LightSteelBlue LightYellow Lime LimeGreen Linen Magenta Maroon MediumAquaMarine
      \ MediumBlue MediumOrchid MediumPurple MediumSeaGreen MediumSlateBlue MediumSpringGreen
      \ MediumTurquoise MediumVioletRed MidnightBlue MintCream MistyRose Moccasin NavajoWhite Navy
      \ OldLace Olive OliveDrab Orange OrangeRed Orchid PaleGoldenRod PaleGreen PaleTurquoise
      \ PaleVioletRed PapayaWhip PeachPuff Peru Pink Plum PowderBlue Purple RebeccaPurple Red
      \ RosyBrown RoyalBlue SaddleBrown Salmon SandyBrown SeaGreen SeaShell Sienna Silver SkyBlue
      \ SlateBlue SlateGray SlateGrey Snow SpringGreen SteelBlue Tan Teal Thistle Tomato Turquoise
      \ Violet Wheat White WhiteSmoke Yellow YellowGreen transparent[] "uses `[]` to escape keyword

syn cluster rasiColor       contains=rasiHexColor,rasiRGBColor,rasiRGBAColor,rasiHSLColor,rasiHSLAColor,rasiCMYKColor,rasiNamedColor
syn cluster rasiInvColor    contains=rasiInvHexColor,rasiInvRGBColor,rasiInvHSLColor,rasiInvCMYKColor
" }}}

syn keyword rasiBool true false

syn match   rasiBadContinuation contained "\\\s\+$"
syn match   rasiCommentSkip     contained "^\s*\*\($\|\s\+\)"
syn region  rasiCommentString   contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=rasiCommentSkip
syn region  rasiComment      matchgroup=rasiCommentStart start="/\*" end="\*/" contains=@rasiCommentGroup,rasiCommentString,rasiCharacter,rasiNumbersCom extend
syn cluster rasiCommentGroup contains=rasiTodo,rasiBadContinuation
syn region  rasiCommentL     start="//" skip="\\$" end="$" keepend
syn keyword rasiTodo         contained TODO FIXME XXX NOTE

syn match   rasiGlobalSection "^*"
syn match   rasiThemeSection "^\a\+"
"syn keyword rasiThemeSection  element element-text element-icon window
"syn keyword rasiThemeSection  mode-switcher button listview error-message
"syn keyword rasiThemeSection  inputbar mainbox
syn keyword rasiElements normal selected alternate

syn region  rasiThemeSectionContent transparent start="{" end="}" contains=@rasiColor,@rasiInvColor

syn keyword rasiTag active urgent
" syn keyword rasi

syn keyword rasiInherit inherit children
syn match rasiGlobPropRef "@\S*"

syn keyword rasiTextStyle bold italic stikethrough underline small caps
syn keyword rasiLineStyle dash solid
syn keyword rasiPosition  center east north west south horizontal vertical
syn keyword rasiCss       calc
" }}}

" Highlighting: {{{1
hi def link rasiNumber        Number
hi def link rasiFloat         Float

hi def link rasiBool          Boolean

hi def link rasiString        String

hi def link rasiTodo          Todo
hi def link rasiComment       Comment
hi def link rasiCommentStart  rasiComment
hi def link rasiCommentL      rasiComment

hi def link rasiThemeSection  StorageClass
hi def link rasiGlobalSection StorageClass

hi def link rasiElements      Type
hi def link rasiGlobPropRef   Include
hi def link rasiTag           Tag

hi def link rasiInherit       Identifier

hi def link rasiTextStyle     Typedef
hi def link rasiLineStyle     Typedef
hi def link rasiPosition      Typedef
hi def link rasiCss           Define

hi def link rasiColor         Number
hi def link rasiHexColor      rasiColor
hi def link rasiRGBColor      rasiColor
hi def link rasiRGBAColor     rasiColor
hi def link rasiHSLColor      rasiColor
hi def link rasiHSLAColor     rasiColor
hi def link rasiCMYKColor     rasiColor
hi def link rasiNamedColor    rasiColor
hi def link rasiInvColor      Error
hi def link rasiInvHexColor   rasiInvColor
hi def link rasiInvRGBColor   rasiInvColor
hi def link rasiInvHSLColor   rasiInvColor
hi def link rasiInvCMYKColor  rasiInvColor
" }}}
