if exists("g:sensitive_expandtab") || &cp
  finish
endif
let g:sensitive_expandtab = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:sensitive_expandtab_show_value')
  let g:sensitive_expandtab_show_value = 1
endif

command! SensitiveExpandtab call sensitive_expandtab#SetSensitiveExpandtab()

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim sw=2 sts=2 et:
