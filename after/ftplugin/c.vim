setlocal comments-=:// comments+=f://

setlocal wildignore+=*.ko,*.mod.c,*.order,modules.builtin

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=80
setlocal expandtab
setlocal cindent
setlocal formatoptions=tcqlron
setlocal cinoptions=:0,l1,t0,g0,(0

syn keyword cOperator likely unlikely
syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64

highlight default link LinuxError ErrorMsg

syn match LinuxError / \+\ze\t/		" Spaces before tab
syn match LinuxError /\s\+$/		" trailing whitespaces
syn match LinuxError /\%81v.\+/		" virtual column 81 and more

" vim: ts=4 et sw=4
