let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_phpcs_args = "--standard=Drupal"

setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal iskeyword+=$

vnoremap <buffer> <leader>d "dyodebug(<c-r>d);<esc>$

augroup FILETYPE
  autocmd!
  autocmd BufWritePost *.module,*.inc silent !ctags -R --language-force=php
augroup END
