

au FileType python nnoremap <leader>cc :norm 0i#<CR>
au FileType python nnoremap <leader>uu :s/^#//<CR>
au FileType python vnoremap <leader>cc :norm 0i#<CR>
au FileType python vnoremap <leader>uu :s/^#//<CR>

au FileType haskell nnoremap <leader>cc :norm 0i-- <CR>
au FileType haskell nnoremap <leader>uu :s/^-- //<CR>
au FileType haskell vnoremap <leader>cc :norm 0i-- <CR>
au FileType haskell vnoremap <leader>uu :s/^-- //<CR>

au FileType rust nnoremap <leader>cc :norm 0i// <CR>
au FileType rust nnoremap <leader>uu :s,^// ,,<CR>
au FileType rust vnoremap <leader>cc :norm 0i// <CR>
au FileType rust vnoremap <leader>uu :s,^// ,,<CR>
