" Vim global plugin for sending visual selection blocks to an open
" terminal inside vim
" Last Change: mié ago 24 22:11:20 CEST 2022
" Maintainer: David Lorenzo
" License: This file is placed in the public domain.

if exists("g:loaded_vim2term")
  finish
endif

let g:loaded_vim2term = 1

function s:SetParams(prologue, epilogue)
  let b:vim2term_prologue = a:prologue
  let b:vim2term_epilogue = a:epilogue
endfunction

function s:OpenTerm()
  if exists("b:vim2term_buf")
    if bufexists(b:vim2term_buf)
      return
    endif
  endif

  let curr_buffer = winbufnr(0)
  let pre_open = term_list()
  below terminal
  for i in term_list()
    if index(pre_open, i) == -1
      call setbufvar(i, "vim2term_buf", i)
      call setbufvar(curr_buffer, "vim2term_buf", i)
      return
    endif
  endfor
endfunction


function s:SendBlock() range
  if ! exists("b:vim2term_buf")
    return
  endif

  if ! bufexists(b:vim2term_buf)
    return
  endif

  let before_after = a:firstline != a:lastline

  if before_after && exists("b:vim2term_prologue") && b:vim2term_prologue != ""
    call term_sendkeys(b:vim2term_buf, b:vim2term_prologue . "\<CR>")
  endif

  for i in range(a:firstline, a:lastline)
    let line_text = getline(i)
    call term_sendkeys(b:vim2term_buf, line_text . "\<CR>")
    call term_wait(b:vim2term_buf)
  endfor

  if before_after && exists("b:vim2term_epilogue") && b:vim2term_epilogue != ""
    call term_sendkeys(b:vim2term_buf, b:vim2term_epilogue . "\<CR>")
  endif

  " set the cursor below the last line of the visual block
  if a:firstline != a:lastline
    execute("normal '>j")
  endif
endfunction


if !hasmapto('<Plug>Vim2termSendblock')
  vmap <unique> <Leader>t <Plug>Vim2termSendblock
endif

" vnoremap/nnoremap don't work here
map <SID>Sendblock :call <SID>SendBlock()<CR>
map <Plug>Vim2termSendblock <SID>Sendblock
vmap <Leader>t <Plug>Vim2termSendblock
nmap <Leader>t <Plug>Vim2termSendblock

if !hasmapto('<Plug>Vim2termOpenTerm')
  nmap <unique> <Leader>T <Plug>Vim2termOpenTerm
endif

" vnoremap/nnoremap don't work here
map <SID>Openterm :call <SID>OpenTerm()<CR>
map <Plug>Vim2termOpenTerm <SID>Openterm
nmap <Leader>T <Plug>Vim2termOpenTerm


autocmd FileType haskell call <SID>SetParams(":{", ":}")
autocmd FileType python call <SID>SetParams("", "\<CR>")
