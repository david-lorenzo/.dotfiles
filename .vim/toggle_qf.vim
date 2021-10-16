function ToggleQuickFix()
	let pg_nr = tabpagenr()
	let tab_info = gettabinfo(pg_nr)
	let tab_windows = tab_info[0]["windows"]
	let qf_open = 0
	for winnr in tab_windows
		let wi = getwininfo(winnr)
		if wi[0]["quickfix"] == 1 && wi[0]["loclist"] == 0
			let qf_open = 1
			break
		endif
	endfor
	if qf_open
		exec("cclose")
	else
		exec("copen")
	endif
endfunction

function ToggleLocal()
	"let curr_bn = getwininfo(win_getid())[0]["bufnr"]
	"let curr_bn = bufnr("%")
	"echo getbufinfo(curr_bn)
	echo getloclist(0)
	echo len(getloclist(0))
	if len(getloclist(0)) > 0
		echo "cerrando"
		exec("lclose")
	else
		echo "abriendo"
		exec("lopen")
	endif
endfunction
