#set text(
    font: "Roboto Slab",
    size: 9pt
)
#set page(
    paper: "a5"
)

#align(center)[
    = Lemur's VIM cheatsheet

    `<leader>` key is comma.
]

#columns(2, gutter: 12pt)[
== General

- `gA` - Align text:
  - `s`: Set split pattern.
  - `j`: Justify left/right
  - `m`: Set delimiter.
- `<C-n>` - Open file tree:
  - `r` - Rename node.
  - `d` - Delete node.
  - `a` - Add file.
  - `C` - Use as root node.
  - `P` - Print absolute path.

== Version control

- `<leader>G` - Open `lazygit`:
  - `c`: Commit.
  - `p`: Pull.
  - `s`: Stash.
  - `P`: Push.
  - `s`: Squash below.
  - `z`: Undo last action.

== Code

- `gc` - Comment out lines in visual mode.
- `gd` - Go to definition.
- `gr` - Show references.
- `gS / gJ / gM` - Split/Join/Toggle lines.
- `K` - Show docs in normal mode.
- `[d / ]d` - Go to next/prev diagnostic.
- `<leader>k` - Add highlight for symbol.
- `<leader>gh` - Open line in Github.
- `<leader>gb` - Blame line in Github.
- `<leader>gi` - Call hierarchy.
- `<leader>dt` - Disable diagnostics.
- `<leader>t` - Run current test.
- `<leader>T` - Run all tests.
- `<leader>rn` - Rename symbol.
- `<leader>la` - Run Code Lens action.
- `<leader>ca` - Run Code action.

== Trouble

- `<leader>x` - Toggle Trouble window.
- `<leader>xw` - Trouble Workspace Diagnostics.
- `<leader>xd` - Trouble Document Diagnostics.
- `<leader>xl` - Trouble Location List.
- `<leader>xq` - Trouble Quickfix.
- `[[ / ]]` - Next/Prev Trouble entry.
- `<C-t>` - Send telescope contents to Trouble.

== Complete

- `<Tab>` - Start completion / Snippet hop
- `<C-Space>` - Start completion (no prefix)

== Packages

- `:Mason` - Install language servers.
- `:Lazy` - Manage plugins.
- `:GoUpdateBinaries` - Install latest tools.

== Go

- `<leader>a` - Jump between test and code file.
- `<leader>gcf` - View coverage for file.
- `<leader>gct` - View coverage for test.
- `:GPToggle` - Open Go playground.
- `:GoDebug` - debug current test.
- `:GoFillStruct` - Add struct members.
- `:GoAddTag` - Add json tags.
- `:GoImpl [recv] [iface]` - Generate method stubs of `iface` on `recv`.

== Finding things

- `<leader>b` - Find buffer.
- `<leader>s` - Find symbols.
- `<leader>f` - Find files.
- `<leader>F` - Find global files (frecency).
- `<leader>g` - Find string under cursor.
- `<leader>h` - Find help topic.
- `s / S` - jump/select based on search pattern.

== Windows / Buffers / Tabs

- `<C-Left>` - Go one window left
- `<C-Right>` - Go one window right
- `<C-Down>` - Go one window down
- `<C-Up>` - Go one window up
- `<C-q>` - Quite current window.
- `<C-A-Left>` - Go one tab left.
- `<C-A-Right>` - Go one tab right.

== Misc

- `<leader>< / >` - Print "«" / "»"
- `<leader>ev` - Edit vimrc
- `:W / :Q` - Same as `:w` / `:q`
- `:<leader>m` - Do some basic math.
- `v.` - Select increasing number of syntax scope (more `.` = more selection)
- `ysiw)` - Add »()« around the curent word.
- `cst` - Change tags to input.
- `dst` - Delete HTML tags.

== Normal stuff

- `cc`: Change line.
- `%`: Move to other brace.
- `zz`: Center on screen.
- `C-u`: Move page up.
- `C-d`: Move page down.
- `gp`: Paste clipboard in normal mode.
- `v=`: Fix indent.
]

== File Management

- `:Oil`:
  - `C-s`: Select child in vsplit.
  - `_`: Open current working directory.
  - `-`: Open parent directory.
  - `~`: Change directory to current one.
- `<leader>n` - Show current in file tree.

== Firefox / Tridactyl

- `f`: Follow link.
- `b`: List of open tabs.
- `s`: Google search.
- `H / L`: Go back/forth in history.
- `/`: Search
  - `<C-g>`: Go to next match.
  - `<C-G>`: Go to prev match.
- `v`: Visual mode
  - `s`: Search selected text
  - `y`: Copy to clipboard
- `]]`: Guess next page
- `m[A-Z]`: Mark tab with letter.
- ``\``` `[A-Z]`: Jump to mark.
- ``\` \```: Jump back.
