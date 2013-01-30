" Vim syntax file
" Language: Notes
" Author: Alex Paulson

if exists('b:current_syntax')
    finish
endif

let b:current_syntax = 'notes'
set conceallevel=2

" Check for spelling errors all up in this
syntax spell toplevel

syntax match ruler /#/ contains=rulerSymbol
syntax match rulerSymbol contained /#/ conceal cchar=█
highlight link rulerSymbol Comment

syntax match point /\*/ contains=point
syntax match point contained /\*/ conceal cchar=•
highlight link point Operator

syntax match Kwrd /^I\w\{3,}:/ contains=Kwrd
hi link Kwrd Define

syntax match IP4 /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}/ contains=IP4
hi link IP4 Statement

syntax match IP6 /\S\{1,4}:\S\{1,4}:\S\{1,4}:\S\{1,4}\S\{1,4}:\S\{1,4}:\S\{1,4}:\S\{1,4}/ contains=IP6
hi link IP6 Statement

syntax match UsrPass /\S\{1,20}\s:\s\S\{4,60}/
hi link UsrPass String

syntax match Head /\s\{2,}\S\{2,}\s\{2,}/
hi link Head Error
