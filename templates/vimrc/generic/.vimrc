" Synesis generic / mixed-language project .vimrc — aligned with
" .vscode/settings.json (generic union defaults)

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

" editor.detectIndentation: false — global defaults (editor.tabSize: 2, insertSpaces: false)
set colorcolumn=76
set noexpandtab
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

augroup sis_generic
  autocmd!
  " [bat]
  autocmd FileType bat,dosbatch setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=60,76

  " [c] / [cpp]
  autocmd FileType c,cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=60,64,68,72,76

  " [cmake]
  autocmd FileType cmake setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

  " [csharp]
  autocmd FileType cs,csx setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=76

  " [go]
  autocmd FileType go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=60,76,100

  " [javascript] / [typescript]
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=76

  " [json] / [markdown] / [ruby] / [yaml]
  autocmd FileType json,markdown,ruby,yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  " [python]
  autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=50,60,76,120

  " [rust]
  autocmd FileType rust setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=76

  " [shellscript]
  autocmd FileType bash,sh,zsh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=60,76

  " [toml]
  autocmd FileType toml setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

  " [zig]
  autocmd FileType zig setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=76

augroup END
