set showtabline=0

"window management
au FocusLost * :silent! wall "save if focus lost
au VimResized * :wincmd = "also resize split windows on resize

"easy split window navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
set wmh=0 "Make Windows resizeable to statusline only

inoremap <leader>r «
inoremap <leader>l »

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set background=light " or dark
colorscheme kalisi

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
