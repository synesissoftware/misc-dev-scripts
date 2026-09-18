" Synesis JavaScript project .vimrc — aligned with .vscode/settings.json (JavaScript)

set nocompatible
filetype indent plugin on
syntax enable
set autoindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set number

" files.insertFinalNewline
set eol
set fixeol

" editor.renderWhitespace: all
set list
set listchars=tab:->,trail:-,extends:>,precedes:<,nbsp:+

" editor.detectIndentation: false — global defaults match [javascript] (editor.tabSize: 2, insertSpaces: true)
set colorcolumn=76
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" colorcolumn draws a full-column tint in Vim (not a VS Code-style 1px line).
" Keep it subtle via the ColorColumn highlight group; reapply after colorscheme changes.
if has('termguicolors')
  " set termguicolors
endif

function! s:ConfigureColorColumn() abort
  highlight ColorColumn ctermbg=236 guibg=#2a2a2a cterm=NONE gui=NONE
endfunction

call s:ConfigureColorColumn()
autocmd ColorScheme * call s:ConfigureColorColumn()

" files.trimTrailingWhitespace
autocmd BufWritePre * %s/\s\+$//e

augroup sis_javascript
  autocmd!
  " [javascript] / [typescript] — Prettier / house 2-space
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=76

  " [json] / [markdown] / [yaml]
  autocmd FileType json,markdown,yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  " [shellscript]
  autocmd FileType bash,sh,zsh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=60,76

augroup END
