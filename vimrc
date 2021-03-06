" Line numbers in gutter
set number
" Line and column number in lower-right corner
set ruler

" Use modelines - must be one of the first three lines.
set modeline
set modelines=3

"
" Tabbing
set tabstop=2
" Insert tabstop spaces instead of a tab (ctrl-V-tab for tab)
set expandtab
" Indent by this many spaces when doing autoindent
set shiftwidth=4

" Solarized theme
syntax enable
if has('gui_running')
  set background=dark
  colorscheme solarized
  " Kill the audible bell!
  set visualbell
endif

" Soft wrap
set wrap linebreak textwidth=0

" Map window movement keys to ctrl-cursor
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map shift-up and shift-down to scroll window up and scroll window down
map <S-Up> <C-Y>
map <S-Down> <C-E>

" Don't complain when moving away from a dirty buffer, just create 
" a hidden one
set hidden

"
" Invisisbles

" Toggle display of invisible chars with \l
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"
" Filetype stuff
if has("autocmd") 
    " Enable filetype detection
    filetype plugin indent on

    " Set special options for one kind of file:
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType php setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead *.mkd setfiletype markdown
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=5 sts=4 sw=2 noexpandtab spell spelllang=en_us
    autocmd FileType python setlocal foldmethod=indent foldlevel=99
endif

"
" Turn off search highlights with C-l
noremap <silent> <c-l> :nohls<cr><c-l>

"
" :edit hacks
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"
" Open file relative to current file in new window
map <leader>ew :e %%
" Open file relative to current file in new split
map <leader>es :sp %%
" Open file relative to current file in new vertical split
map <leader>ev :vsp %%
" Open file relative to current file in new tab
map <leader>en :tabe %%

" 
" Make underscores (_) word separators, so e.g. foo_bar is considered two
" words, not one.
set iskeyword-=_

" Pathogen
execute pathogen#infect()
filetype off
call pathogen#incubate()
call pathogen#helptags()

" Clojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Writing with vim-pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for 
highlight SpellBad term=underline cterm=underline gui=underline ctermbg=8
