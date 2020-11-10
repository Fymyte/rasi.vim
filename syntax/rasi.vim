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

syn keyword rasiBool true false

syn match   rasiBadContinuation contained "\\\s\+$"
syn match   rasiCommentSkip     contained "^\s*\*\($\|\s\+\)"
syn region  rasiCommentString   contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=rasiCommentSkip
syn region  rasiComment      matchgroup=rasiCommentStart start="/\*" end="\*/" contains=@rasiCommentGroup,rasiCommentString,rasiCharacter,rasiNumbersCom extend
syn cluster rasiCommentGroup contains=rasiTodo,rasiBadContinuation
syn region  rasiCommentL     start="//" skip="\\$" end="$" keepend
syn keyword rasiTodo         contained TODO FIXME XXX

syn match   rasiGlobalSection "^*"
syn keyword rasiThemeSection  element element-text element-icon window
syn keyword rasiThemeSection  mode-switcher button listview error-message
syn keyword rasiThemeSection  inputbar mainbox
syn keyword rasiElements normal selected alternate

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
" }}}
