#set text(
    font: "Roboto Slab",
    size: 8pt
)
#set page(
    paper: "a5"
)

#align(center)[
    = Lemur's VIM cheatsheet

    `<leader>` key is comma.
]

#columns(2, gutter: 12pt)[
== General:

- `:<leader>m` - Do some basic math.
- `:Tabularize` - Align text in tables.
- `<leader>cc` - Dismiss notifications (`:Noice dismiss`)
- `<C-n>` - Open file tree:
  - `r` - Rename
  - `d` - Delete file
  - `a` - Add file
  - `C` - Use as root node
  - `P` - Print absolute path

== Version control

- `:Git <subcommand>` - Execute git command (nice `:Git diff`)

== Code:

- `gc` - Comment out lines in visual mode.
- `gd` - Go to definition.
- `gr` - Show references.
- `gS / gJ` - Split/Join lines.
- `K` - Show docs in normal mode.
- `[d / ]d`- Go to next/prev diagnostic.
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
- `<leader>xx` - Open Trouble window.

== Packages

- `:Mason` - Install language servers.
- `:Lazy` - Manage plugins.
- `:GoUpdateBinaries` - Install latest tools.

== Go:

- `<leader>a` - Jump between test and code file (`:GoAlt`)
- `<leader>gcf` - View coverage for file.
- `<leader>gct` - View coverage for test.
- `:GPToggle` - Open Go playground.
- `:GoDebug` - debug current test.
- `:GoFillStruct` - Add empty struct members.
- `:GoFillSwitch` - Fill switch cases.
- `:GoFillSwitch` - Fill switch cases.
- `:GoAddTag` - Add json tags.
- `:GoImpl [recv] [iface]` - Generate method stubs of `iface`

== Finding things:

- `<leader>b` - Find buffer.
- `<leader>s` - Find symbols.
- `<leader>f` - Find symbols.
- `<leader>g` - Find string under cursor.
- `<leader>h` - Find help topic.
- `<leader>m` - Show current file in tree.

== Windows / Buffers / Tabs

- `<C-Left>` - Go one window left
- `<C-Right>` - Go one window right
- `<C-Down>` - Go one window down
- `<C-Up>` - Go one window up
- `<C-q>` - Quite current window.
- `<C-A-Left>` - Go one tab left.
- `<C-A-Right>` - Go one tab right.

== Complete

- `<Tab>` - Start completion / Snippet hop
- `<C-Space>` - Start completion (no prefix)

== Misc

- `<leader><` - Print "«"
- `<leader>>` - Print "«"
- `<leader>ev` - Edit vimrc
- `:W / :Q` - Same as `:w` / `:q`
- `v.` - Select increasing number of syntax scope (more `.` = more selection)
]
