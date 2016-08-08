" list of plugins {{{
call plug#begin('~/.vim/plugged')

" file system navigation
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" linter
Plug 'scrooloose/syntastic'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" snippets 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" buffer navigation
Plug 'tpope/vim-unimpaired'

" decoration stuff
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'myusuf3/numbers.vim'

" organiser features
Plug 'TaskList.vim'
Plug 'duff/vim-scratch'

" auto completion
Plug 'ervandew/supertab'

" python
Plug 'davidhalter/jedi-vim'

" text navigation
Plug 'justinmk/vim-sneak'
Plug 'thinca/vim-visualstar'

" script runner
Plug 'thinca/vim-quickrun'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'

" language support
Plug 'sheerun/vim-polyglot'

" misc
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'matchit.zip'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vladgor/metal-vim-rising'
Plug 'junegunn/goyo.vim'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vladgor/itg_flat_vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'wombat256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'

call plug#end()
"}}}


" plugins settings {{{
"---
"SuperTab
"---
let g:SuperTabDefaultCompletionType = "context"


"---
"Jedi
"---
let g:jedi#popup_on_dot = 0


"---
"UltiSnips
"---
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-j>"


"---
"Syntastic
"---
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let b:syntastic_mode = "active"
let g:syntastic_loc_list_height = 4


"---
"Ctrlp
"---
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = '~/.vim/ctrlp/'
let g:ctrlp_max_depth = 10
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_extensions = ['tag','mixed']
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_custom_ignore = '\v\.(o|git|hg|svn)$'


"---
"GitGutter
"---
" let g:gitgutter_enabled = 1


"---
"NERDTree
"---
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1


"---
"Rainbow parentheses
"---
augroup rainbow_parentheses
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup end


"---
"Sneak
"---
let g:sneak#streak = 1


"---
"Lightline
"---

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'fugitive' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
"}}}
