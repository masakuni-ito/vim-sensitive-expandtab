function! sensitive_expandtab#SetSensitiveExpandtab() abort

  let l:expandtab = sensitive_expandtab#GuessExpandtab(getline(0, line("$")))

  let &l:expandtab = l:expandtab

  if g:sensitive_expandtab_show_value
    echo &l:expandtab == 1 ? "SensitiveExpandtab: set space" : "SensitiveExpandtab: set tab"
  endif

endfunction

function! sensitive_expandtab#GuessExpandtab(lines) abort

  " default is set value
  let l:expandtab = &expandtab

  let l:space_count = 0
  let l:tab_count = 0

  for line in a:lines
    if line =~ "^ "
      let l:space_count = l:space_count + 1
    elseif line =~ "^\t"
      let l:tab_count = l:tab_count + 1
    endif
  endfor

  if l:space_count < l:tab_count
    let l:expandtab = 0
  elseif l:space_count > l:tab_count
    let l:expandtab = 1
  endif

  return l:expandtab
endfunction

" vim:set ft=vim sw=2 sts=2 et:
