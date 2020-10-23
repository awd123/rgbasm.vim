" Vim filetype plugin file
" Language: RGBASM assembly
" Maintainer: Austin Dunn

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

let b:undo_ftplugin = "setl ai< cin< cink< et< ts< sw< sts<"

setlocal autoindent cindent nolisp nosmartindent
setlocal indentexpr&
setlocal cinkeys&
setlocal cinkeys=:,o,O
setlocal cinoptions&
setlocal cinwords=macro,Macro,MACRO
setlocal noexpandtab
setlocal tabstop=8 shiftwidth=8 softtabstop=8
