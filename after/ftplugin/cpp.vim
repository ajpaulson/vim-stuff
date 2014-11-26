setlocal comments-=:// comments+=f://

setlocal wildignore+=*.ko,*.mod.c,*.order,modules.builtin

augroup linuxstyle
    autocmd!

    autocmd FileType c,cpp call s:LinuxFormatting()
    autocmd FileType c,cpp call s:LinuxKeywords()
    autocmd FileType c,cpp call s:LinuxHighlighting()
    autocmd FileType diff,kconfig setlocal tabstop=8
augroup END

function s:LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:LinuxKeywords()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
endfunction

function s:LinuxHighlighting()
    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/		" Spaces before tab
    syn match LinuxError /\s\+$/		" trailing whitespaces
    syn match LinuxError /\%81v.\+/		" virtual column 81 and more
endfunction

" vim: ts=4 et sw=4
