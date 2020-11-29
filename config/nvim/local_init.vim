set showtabline=0

" Do not wrap by default
set nowrap

"window management
au FocusLost * :silent! wall "save if focus lost
au VimResized * :wincmd = "also resize split windows on resize

set spell spelllang=en

"easy split window navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
set wmh=0 "Make Windows resizeable to statusline only

inoremap <leader>r «
inoremap <leader>l »

set termguicolors

" set background=dark
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

set background=light
colorscheme NeoSolarized
let g:airline_theme='solarized'

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

set expandtab
set tabstop=4

map <C-Space> :CtrlSpace<CR>
set clipboard=unnamedplus

set nocursorcolumn
syntax sync minlines=256
set re=1

let g:go_fmt_command = "goimports"
map <C-c>g :GoDef<CR>
map <F1> :Files<CR>
map <F2> :Rg<CR>
map <F3> :Tags<CR>
map <F4> :Commits<CR>

map <F5>  :DlvToggleBreakpoint<CR>
map <F9>  :DlvTest<CR>
map <F8>  :DlvDebug<CR>
map <F9>  :cn<CR>
map <F10> :cn<CR>
map <F11> :setlocal spell! <CR>



" TODO: Remove when gocode performance got better.
"       Makes autocompletion faster.
let g:go_gocode_propose_source = 0

set list
set listchars=tab:>-

" Small fix for the too dark listchars:
highlight NonText guifg=#eee8d5
