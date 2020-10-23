" Vim syntax file
" Language: Gameboy Z80 assembly (RGBASM)
" Maintainer: Austin Dunn

if exists("b:current_syntax")
  finish
endif

" RGBASM is case insensitive
syn case ignore

setlocal comments=:;
setlocal iskeyword=@,48-57,%,&,$,`,.,_

" Comments:
syn region  rgbasmComment       start=";" keepend end="$" contains=rgbasmInCommentTodo
syn keyword rgbasmInCommentTodo contained TODO FIXME
syn cluster rgbasmGrpInComments contains=rgbasmInCommentTodo
syn cluster rgbasmGrpComments   contains=@rgbasmGrpInComments,rgbasmComment

" Labels:
syn match rgbasmLabel "\<\h\k*\>"
syn match rgbasmLocalLabel "\<\.\h\k*\>"

" Literals:
syn match rgbasmBinNumber "\<%[0-1]\+\>"
syn match rgbasmOctNumber "\<\&\o\+\>"
syn match rgbasmDecNumber "\<\d\+\>"
syn match rgbasmHexNumber "\<\$\x\+\>"
syn match rgbasmCharConst '"[^"]\{-}"'
syn match rgbasmGBGraphics "\<`[0-3]\+\>"
syn cluster rgbasmNumber contains=rgbasmBinNumber,rgbasmOctNumber,rgbasmDecNumber,rgbasmHexNumber
syn cluster rgbasmLiteral contains=@rgbasmNumber,rgbasmCharConst,rgbasmGBGraphics

" Addresses:
syn match rgbasmMemRef "\[[^;[\]]\{-}\]" contains=@rgbasmLiteral
syn match rgbasmIndirectAddr "\[\(af\|bc\|de\|hl[id]\?\)\]" contains=rgbasmIncrDecrReg

" GBZ80 Mnemonics:
syn keyword rgbasmMnemonic adc add and bit call ccf cp cpd cpdr cpi cpir cpl daa
syn keyword rgbasmMnemonic dec di djnz ei ex exx halt im in inc ind indr ini
syn keyword rgbasmMnemonic inir jp jr ld ldh ldd lddr ldi ldir neg nop or otdr
syn keyword rgbasmMnemonic otir out outd outi pop push res ret reti retn rl rla
syn keyword rgbasmMnemonic rlc rlca rld rr rra rrc rrca rrd rst sbc scf set sla
syn keyword rgbasmMnemonic sll sra sub xor

syn keyword rgbasmDirective alias align break case db defb defs defw ds dw else
syn keyword rgbasmDirective end endif endm endr ends equ equs error expand if
syn keyword rgbasmDirective ifdef ifndef incbin include list macro message
syn keyword rgbasmDirective messg noexpand nolist org processor repeat rept
syn keyword rgbasmDirective rorg seg segu set switch unalias unset warning
syn keyword rgbasmSectionDirective section export
syn keyword rgbasmSections rom0 romx vram sram wram0 wramx oam hram align bank home bss

syn keyword rgbasmReg8 a b c d e h l
syn keyword rgbasmReg16 af bc de hl
syn keyword rgbasmRegSpecial pc sp
syn keyword rgbasmIncrDecrReg transparent contained hli hld
syn cluster rgbasmAddrReg contains=rgbasmReg16,rgbasmIncrDecrReg
syn keyword rgbasmCond z nz c nc

syn sync clear

" Comment Group:
hi def link rgbasmComment       Comment
hi def link rgbasmInCommentTodo Todo

" Label Group:
hi def link rgbasmLabel Identifier
hi def link rgbasmLocalLabel Identifier

" Constant Group:
hi def link rgbasmCharConst  String
hi def link rgbasmBinNumber Number
hi def link rgbasmOctNumber Number
hi def link rgbasmDecNumber Number
hi def link rgbasmHexNumber Number
hi def link rgbasmGBGraphics Special

" Directive Group:
hi def link rgbasmDirective Macro
hi def link rgbasmSectionDirective Operator

" Register Group:
hi def link rgbasmReg8 PreProc
hi def link rgbasmReg16 PreProc
hi def link rgbasmRegSpecial Special
hi def link rgbasmIndirectAddr Type
hi def link rgbasmSections Type
hi def link rgbasmMemRef Constant

hi def link rgbasmCond Underlined

" Instruction Group:
hi def link rgbasmMnemonic Statement

let b:current_syntax = "rgbasm"
