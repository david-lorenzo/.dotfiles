" See post and github:
" https://www.statox.fr/posts/2020/07/vim_flash_yanked_text/
" https://github.com/statox/FYT.vim?tab=readme-ov-file
"

augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * call FlashYankedText()
augroup END

function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif

    let matchId = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(300, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
    while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]

        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction
