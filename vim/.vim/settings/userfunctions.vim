function! StatusLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' ' . branch : '[not git]'
  endif
  return ''
endfunction

"Taken from here: http://stackoverflow.com/a/6271254
function! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Taken from here:
" https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
function! Search(...)
  let default_text = get(a:, 1, '')
  let grep_term = input("Search for: ", default_text)

  if !empty(grep_term)
    execute 'silent! grep!' grep_term | copen
  endif
  redraw!
endfunction

function! SearchVisual()
  call Search("'" . escape(GetVisualSelection(), ".+*?=/$^[](){}|'\"") . "'")
endfunction

command! Search call Search()
command! SearchVisual call SearchVisual()
