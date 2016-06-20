execute pathogen#infect()
set gfn=Monospace\ 18
set number
set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

"for russian layout
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
:setlocal spell spelllang=ru_yo,en_gb
"set clipboard=unnamedplus
syntax on
colorscheme solarized8_dark
filetype plugin on
au BufEnter *.hs compiler ghc
:let g:ghc="/usr/bin/ghc"
:let g:haddock_browser="/usr/bin/firefox"

"for syntastic
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"for ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"for smarttab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif
"haskellmode completion
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
