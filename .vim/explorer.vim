" Vim plugin to clean up empty buffers when open/closing Lex
" Last Change: mié ago 24 22:07:43 CEST 2022
" Maintainer: Davi Lorenzo
" License: This file is placed in the public domain.

function s:CleanUselessBuffers()
	for buf in getbufinfo({'buflisted':1})
		if buf.name == "" && buf.changed == 0
			:execute ':bdelete ' . buf.bufnr
		endif
	endfor
endfunction

function s:ToggleLex()
	call s:CleanUselessBuffers()
	:Lexplore
endfunction

map <Plug>ToggleLex :call <SID>ToggleLex()<CR>
