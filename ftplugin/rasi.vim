" ftplugin/rasi.vim

" Vim Plugin: {{{1
" File:          rasi.vim
" Author:        Marco Cantoro <marco.cantoro92@outlook.it>
" Description:   Rofi Advanced Style Information
" Last Modified: 2020-11-09
" }}}

" File Type Plugin Guards: {{{1
if exists('g:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1
" }}}

" Filetype Options: {{{1
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal iskeyword+=-
" }}}

let b:undo_ftplugin = "setl com< cms< fo< spell< fdm< ts< sts< et< sw< tw< "
