set nocompatible

set path+=**

"set ts= sw= sts=
set tabstop=4 shiftwidth=4 softtabstop=4

set cursorline
set cursorcolumn
set nowrap
set number
set relativenumber
set smartindent
set colorcolumn=80
set hls

" call mkdir("~/.vim/tempfiles", "p")
set directory=~/.vim/tempfiles//
set undodir=~/.vim/tempfiles//
set backupdir=~/.vim/tempfiles//

highlight EmptySpace ctermbg=green
match EmptySpace /\s\+$/
let g:netrw_liststyle= 3 " tree view
let g:netrw_banner= 0 " disable banner
let g:netrw_browse_split= 4 " previous window
let g:netrw_altv=1 " open to the right

" disabling syntastic putting it in passive mode
" syntastic is synchronous and it makes vim halt when saving a file
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

filetype plugin indent on

autocmd FileType html setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType css setlocal sw=2 sts=2 ts=2 et
autocmd FileType haskell setlocal sw=2 sts=2 ts=2 et
autocmd FileType python setlocal sw=4 sts=4 ts=4 et

" remove trailing white space
autocmd BufWrite *.html,*.js,*.css,*.hs,*.py,*.rs :%s/\s\+$//e

let mapleader = "ñ"

source ~/.vim/vim2term.vim
source ~/.vim/comment.vim
source ~/.vim/coding_autoclose.vim
source ~/.vim/toggle_qf.vim


nnoremap <C-l> :bn!<CR>
nnoremap <C-h> :bp!<CR>

vnoremap <tab> >gv
vnoremap <s-tab> <gv
nnoremap <tab> >>
nnoremap <s-tab> <<

nnoremap <leader>B :ls<CR>:b 
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>w :up<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" similar of what surround does
vnoremap <leader>" <Esc>`>a"<Esc>`<i"<Esc>f"
vnoremap <leader>' <Esc>`>a'<Esc>`<i'<Esc>f'
vnoremap <leader>( <Esc>`>a)<Esc>`<i(<Esc>f)
vnoremap <leader>) <Esc>`>a)<Esc>`<i(<Esc>f)
vnoremap <leader>[ <Esc>`>a]<Esc>`<i[<Esc>f]
vnoremap <leader>] <Esc>`>a]<Esc>`<i[<Esc>f]
vnoremap <leader>{ <Esc>`>a}<Esc>`<i{<Esc>f}
vnoremap <leader>} <Esc>`>a}<Esc>`<i{<Esc>f}

nnoremap <leader>q :call ToggleQuickFix()<CR>
nnoremap <leader>l :call ToggleLocal()<CR>
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>K :cfirst<CR>
nnoremap <leader>J :clast<CR>

" A shortcut to open a buffer in a new tab without opening empty buffers
cabbrev tb tab split \| b

" block mode from mouse
set mouse=a
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>
