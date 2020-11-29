" Make it possible to align text in a table using :Tabular /pattern
Plug 'godlygeek/tabular'

" General set of colorschemes. Many of those will not work
" in kitty and/or neovim though. Scheduled for removal.
Plug 'flazz/vim-colorschemes'

" Color parans in rainbow colors, depending on their depth.
Plug 'kien/rainbow_parentheses.vim'

" Workplace manager reachable via Ctrl-Space.
Plug 'szw/vim-ctrlspace'

" Alternate between .c and .h files.
Plug 'vim-scripts/a.vim'

" Nicely looking dark & light themes for dark & light times.
Plug 'jdkanani/vim-material-theme'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'

" General pandoc support, including syntax:
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Proper german spelling support:
Plug 'Yamagi/vim-german-dictionaries'

" Nice start screen with (sometimes) inspirational quotes:
Plug 'mhinz/vim-startify'

" Support for the Capnp marshalling protocol scheme.
Plug 'cstrahan/vim-capnp'

" Go Debugging support (rarely used)
" (Scheduled for removal due to low use)
Plug 'jodosha/vim-godebug'
Plug 'sebdah/vim-delve'

" gS and gJ shortcuts, see:
" https://github.com/AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'

" Elm syntax support:
Plug 'ElmCast/elm-vim'

" Copy current line as Github-Link:
Plug 'ruanyl/vim-gh-line'

" fzf plugin (powering F1-F4)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Automatically write select statements bigger.
Plug 'jorengarenar/vim-SQL-UPPER'

" FindAndReplace for big batch replacement.
Plug 'brooth/far.vim'

" :Goyo concentraion mode and for code review.
Plug 'junegunn/goyo.vim'
