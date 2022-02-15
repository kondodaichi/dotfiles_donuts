let g:trance_level = 0
set transparency=0
func! Trance()
  if g:trance_level == 0
    set transparency=20
    let g:trance_level = 1
  else
    set transparency=0
    let g:trance_level = 0
  endif
endfunc
noremap <D-u> :<C-u>call Trance()<CR>

set blur=0
set guifont=Monaco:h16
set background=dark

"右スクロールバーなし
set guioptions-=r
set guioptions-=R
"左スクロールバーなし
set guioptions-=l
set guioptions-=L
"下スクロールバーなし
set guioptions-=b
" タブの番号とフルパスを表示
set guitablabel=%N\ %f

autocmd BufEnter *
\ if getcwd() =~ 'jbc' |
\   highlight Normal guibg=#100000 |
\ elseif getcwd() =~ 'payrollservice' |
\   highlight Normal guibg=#151500 |
\ elseif getcwd() =~ 'roumu-server' |
\   highlight Normal guibg=#000010 |
\ elseif getcwd() =~ 'roumu-front' |
\   highlight Normal guibg=#001000 |
\ endif

" font size cahnge https://vi.stackexchange.com/questions/3093/how-can-i-change-the-font-size-in-gvim
function! FontSizePlus ()
  let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole + 1
  let l:new_font_size = ':h'.l:gf_size_whole
  let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction
function! FontSizeMinus ()
  let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole - 1
  let l:new_font_size = ':h'.l:gf_size_whole
  let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction
nmap <D--> :call FontSizeMinus()<CR>
nmap <D-+> :call FontSizePlus()<CR>
nmap <D-0> :set guifont=Monaco:h16<CR>
