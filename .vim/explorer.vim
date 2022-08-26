" Vim plugin to clean up empty buffers when open/closing Lex
" Last Change: mié ago 24 22:07:43 CEST 2022
" Maintainer: Davi Lorenzo
" License: This file is placed in the public domain.

function s:CleanUselessBuffers()
	for buf in getbufinfo()
		if buf.name == "" && buf.changed == 0 && buf.loaded == 1
			:execute ':bdelete ' . buf.bufnr
		endif
	endfor
endfunction

function s:ToggleLex()
	call s:CleanUselessBuffers()

	" we iterate through the buffers again because some netrw buffers are
	" skipped after we browsed to a different location and hence the name
	" of the window changed (no longer '')
	let flag = 0
	for buf in getbufinfo()
		if (get(buf.variables, "current_syntax", "") == "netrwlist") && buf.changed == 0 && buf.loaded == 1
			:execute  ':bdelete ' . buf.bufnr
			let flag = 1
		endif
	endfor

	if !flag
		:Lexplore
	endif
endfunction

map <Plug>ToggleLex :call <SID>ToggleLex()<CR>
