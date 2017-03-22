function! statusline#fileprefix()
  let l:basename=expand('%:h')
  if l:basename == '' || l:basename == '.'
    return ''
  else
    " Make sure we show $HOME as ~ (https://goo.gl/LloMaA).
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! statusline#filetype()
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fileencoding()
  if strlen(&fenc) && &fenc != 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! statusline#fileformat()
  if strlen(&ff) && &ff != 'unix'
    return ',' . &ff
  else
    return ''
  endif
endfunction

function! statusline#filesize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return ''
  endif

  if (exists('mbytes'))
    return ',' . mbytes . 'MB'
  elseif (exists('kbytes'))
    return ',' . kbytes . 'KB'
  else
    return ',' . bytes . 'B'
  endif
endfunction

function! statusline#readonly()
  if &readonly || !&modifiable
    return ' '
  else
    return ''
  endif
endfunction

function! statusline#errors()
  let str = ale#statusline#Status()
  let idx = stridx(str, "E")
  let idx2 = stridx(str, "F")
  if idx != -1
    return " " . strpart(str, idx + 1, idx2 - idx - 1) . " "
  else
    return ''
  endif
endfunction

function! statusline#warnings()
  let str = ale#statusline#Status()
  let idx = stridx(str, "W")
  let idx2 = stridx(str, "V")
  if idx != -1
    return " " . strpart(str, idx + 1, idx2 - idx - 1) . " "
  else
    return ''
  endif
endfunction

function! statusline#mode()
  return ''
endfunction

let g:currentmode={
      \ 'n': 'NORMAL',
      \ 'v': 'VISUAL',
      \ 'V': 'VISUAL LINE',
      \ 's': 'SELECT',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \}
