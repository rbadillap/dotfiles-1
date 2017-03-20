set statusline=\                            " Space.
set statusline+=%{statusline#fileprefix()}  " Relative path to directory.
set statusline+=%3*                         " Bold highlight group.
set statusline+=%t                          " Filename.
set statusline+=%*                          " Reset highlight group.
set statusline+=%<                          " Truncation point.
set statusline+=%{statusline#readonly()}
set statusline+=\                           " Space.
set statusline+=%1*                         " Italic highlight group.
" Mofied, redonly, filetype, fileencoding, fileformat, filesize.
set statusline+=%([
      \%M
      \%{statusline#filetype()}
      \%{statusline#fileencoding()}
      \%{statusline#fileformat()}
      \%{statusline#filesize()}
      \]%)
set statusline+=%*                          " Reset highlight group.

" Split point for left and right groups.
set statusline+=%=

set statusline+=%8*
set statusline+=%{statusline#errors()}
set statusline+=%*                          " Reset highlight group.
set statusline+=%9*
set statusline+=%{statusline#warnings()}
set statusline+=%*                          " Reset highlight group.
set statusline+=%7*
set statusline+=\  " Space
" set statusline+=\  " Space
set statusline+=%3l/%L
set statusline+=\  " Space
set statusline+=ℓ    " (Literal, \u2113 "SCRIPT SMALL L").
" set statusline+=\  " Space
set statusline+=\  " Space
set statusline+=%-2v  " current virtual column number.
set statusline+=\  " Space
set statusline+=%*                          " Reset highlight group.
set statusline+=%2*
set statusline+=\  " Space
set statusline+=%3p  " Percentage through buffer.
set statusline+=%%  " Literal %.
set statusline+=\  " Space
