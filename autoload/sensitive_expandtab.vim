function! sensitive_expandtab#SetSensitiveExpandtab() abort

  let expandtab = sensitive_expandtab#GuessExpandtab(getline(0, line("$")))

  let &expandtab = expandtab

  if g:sensitive_expandtab_show_value
    echo expandtab == 1 ? "set expandtab" : "set noexpandtab"
  endif

endfunction

function! sensitive_expandtab#GuessExpandtab(lines) abort

  " default is set value
  let expandtab = &expandtab

  let space_count = 0
  let tab_count = 0

  for line in a:lines
    if line =~ "^ "
      let space_count = space_count + 1
    elseif line =~ "^\t"
      let tab_count = tab_count + 1
    endif
  endfor

  if space_count < tab_count
    let expandtab = 0
  elseif space_count > tab_count
    let expandtab = 1
  endif

  return expandtab
endfunction

" vim:set ft=vim sw=2 sts=2 et:
