set nocompatible
source $VIMRUNTIME/defaults.vim

set backspace=indent,eol,start,nostop

set path+=**

set tabstop=4 shiftwidth=4 softtabstop=4
"set cursorline cursorcolumn colorcolumn=80
set cursorline
set nowrap
set number relativenumber
set smartindent
set hlsearch incsearch
set hidden
set lazyredraw
set wildmenu
set showcmd
set laststatus=2

" call mkdir("~/.vim/tempfiles", "p")
set directory=~/.vim/tempfiles//
set undodir=~/.vim/tempfiles//
set backupdir=~/.vim/tempfiles//

highlight EmptySpace ctermbg=green
match EmptySpace /\s\+$/

" override default for: number and relativenumber
let g:netrw_bufsettings="noma nomod nowrap ro nobl nu rnu"
let g:netrw_browse_split= 0 " previous window
"let g:netrw_altv=1 " open to the right
let g:netrw_preview=1 " open preview on vertical split
"  let g:netrw_winsize=70 " default size
"let g:netrw_banner= 0 " disable banner
"let g:netrw_liststyle= 3 " tree view

" disabling syntastic putting it in passive mode
" syntastic is synchronous and it makes vim halt when saving a file
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

filetype plugin indent on

augroup setTabWhiteSpace
	au!
	autocmd FileType html setlocal sw=2 sts=2 ts=2 et
	autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
	autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
	autocmd FileType css setlocal sw=2 sts=2 ts=2 et
	autocmd FileType haskell setlocal sw=2 sts=2 ts=2 et
	autocmd FileType cabal setlocal sw=2 sts=2 ts=2 et
	autocmd FileType python setlocal sw=4 sts=4 ts=4 et
augroup End

" remove trailing white space
augroup removeTrailingSpace
	au!
	autocmd BufWrite *.html,*.js,*.css,*.hs,*.py,*.rs,*.go :%s/\s\+$//e
augroup End


let mapleader = "ñ"

"source ~/.vim/explorer.vim
source ~/.vim/vim2term.vim
source ~/.vim/comment.vim
"source ~/.vim/coding_autoclose.vim
source ~/.vim/toggle_qf.vim
source ~/.vim/yank_highlight.vim

nnoremap n nzz
nnoremap N Nzz
nnoremap gb :bnext!<CR>
nnoremap gB :bprevious!<CR>

vnoremap <tab> >gv
vnoremap <s-tab> <gv
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap p "_dp
vnoremap P "_dP
"nnoremap <c-Y> zh
"nnoremap <c-E> zl

"nmap <leader>f <Plug>ToggleLex
nmap <leader>f <cmd>Explore %:p:h<CR>
nnoremap <leader>B :ls<CR>:b
"nnoremap <leader>p :bp<CR>		"not used very often
"nnoremap <leader>n :bn<CR>		"not used very often
nnoremap <leader>w :update<CR>
nnoremap <leader>ev :edit $MYVIMRC<CR>
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

" move up and down while the buffer is in wrap mode
nnoremap j gj
nnoremap k gk

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

augroup focus
	au!
	au BufEnter * :hi StatusLine ctermbg=white ctermfg=blue
	au BufLeave * :hi StatusLine ctermbg=black ctermfg=white
augroup End

augroup markdown
	au!
	au BufRead *md :setl wrap
augroup End

"hi TabLineSel ctermbg=blue ctermfg=white

" moving through the windows using the cursor keys
" nnoremap <A-Left>  <C-W>h
" nnoremap <A-Down>  <C-W>j
" nnoremap <A-Up>    <C-W>k
" nnoremap <A-Right> <C-W>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" nnoremap <M-h> <C-W>h
" nnoremap <M-j> <C-W>j
" nnoremap <M-k> <C-W>k
" nnoremap <M-l> <C-W>l

" rearrangint the windows using the cursor keys
nnoremap <C-Left>  <C-W>H
nnoremap <C-Down>  <C-W>J
nnoremap <C-Up>    <C-W>K
nnoremap <C-Right> <C-W>L

nnoremap <Left>  gT
nnoremap <Right> gt

"nnoremap <Up>   :bp<CR>	" not liking it very much
"nnoremap <Down> :bn<CR>	" not liking it very much

tnoremap <S-Insert> <C-W><C-N>"*pi
"nmap <Esc> <cmd>nohls<CR>

syntax on

" Trick 1:
" inside the command line (:), when using `norm` (:'<,'>norm ) and a set of
" moves we can insert <Esc> pressing <C-v> <C-[>, this will add a char ^[ to
" indicate the <Esc> key and we will be able to continue the command with more
" movements
