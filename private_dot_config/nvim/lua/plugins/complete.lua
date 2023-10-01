local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local config = function()
    -- Set configuration for specific filetype.
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
            }),
        },
        sources = cmp.config.sources({
            {name = "nvim_lsp"},
            {name = "luasnip_choice"},
            {name = "path"},
            {name = "buffer"},
            {name = "calc"},
        }),
        completion = {
            autocomplete = false,
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        window = {
           completion = cmp.config.window.bordered(),
           documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jump() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() then
                  cmp.select_next_item()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                elseif cmp.visible() then
                  cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
    })

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return {
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = {
            'hrsh7th/nvim-cmp',
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'petertriho/cmp-git',
            'f3fora/cmp-spell',
            'nvim-tree/nvim-web-devicons',
            'doxnit/cmp-luasnip-choice',
            'hrsh7th/cmp-calc',
        },
        config = config,
    },
    {
        'doxnit/cmp-luasnip-choice',
        config = function()
            require('cmp_luasnip_choice').setup({
                auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
            });
        end,
    },
}
