if has("gui_running") || has('nvim')
  " deinが読み込まれない時は、:call dein#recache_runtimepath() をしてみよう
  if &compatible
    set nocompatible
  endif
  " Required:
  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
  " Required:
  if dein#load_state($HOME . '/.cache/dein')
    call dein#begin($HOME . '/.cache/dein')
    let s:toml_dir  = $HOME . '/.config/nvim/dein/toml'
    let s:toml      = s:toml_dir . '/dein.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    " Let dein manage dein
    " Required:
    call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')
    " Required:
    call dein#end()
    call dein#save_state()
  endif
  " Required:
  filetype plugin indent on
  syntax enable
  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif

if has("gui_running") || has('nvim') " macvim
  source ~/.vimrc_main
  " if has("nvim")
  "   colorscheme desert
  " endif
else " raw vim
  source ~/.vimrc_mini
  colorscheme desert
endif

" if has("gui_running")
"   let g:istrance = 1
"   set transparency=0
"   func! Trance()
"     if g:istrance == 1
"       set transparency=20
"       let g:istrance = 0
"     else
"       set transparency=0
"       let g:istrance = 1
"     endif
"   endfunc
"   noremap <D-u> :<C-u>call Trance()<CR>

"   set blur=0
"   " set guifont=SFMono-Regular:h16

"   "右スクロールバーなし
"   set guioptions-=r
"   set guioptions-=R
"   "左スクロールバーなし
"   set guioptions-=l
"   set guioptions-=L
"   "下スクロールバーなし
"   set guioptions-=b

"   " font size cahnge https://vi.stackexchange.com/questions/3093/how-can-i-change-the-font-size-in-gvim
"   function! FontSizePlus ()
"     let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
"     let l:gf_size_whole = l:gf_size_whole + 1
"     let l:new_font_size = ':h'.l:gf_size_whole
"     let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
"   endfunction
"   function! FontSizeMinus ()
"     let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
"     let l:gf_size_whole = l:gf_size_whole - 1
"     let l:new_font_size = ':h'.l:gf_size_whole
"     let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
"   endfunction
"   nmap <D--> :call FontSizeMinus()<CR>
"   nmap <D-+> :call FontSizePlus()<CR>
"   nmap <D-0> :set guifont=SFMono-Regular:h16<CR>
" endif
