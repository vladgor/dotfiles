let g:phpactorInitialCwd=FindProject('.git')
nnoremap <buffer> g] :call phpactor#GotoDefinition()<cr>
autocmd! FileType php setlocal omnifunc=phpactor#Complete

let g:ale_fixers = {
      \   'php': [
      \       'php_cs_fixer',
      \   ],
      \}

let g:ale_php_phpmd_executable = 'phpmd'
let g:ale_php_phpmd_ruleset = 'unusedcode,cleancode,codesize'
let g:ale_php_phpmd_suffixes = 'php,module,inc,theme,install,profile,theme'
let b:ale_fix_on_save = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal iskeyword+=$
