local languages = {
   "clangd",
   "html",
   "cssls",
   "ts_ls",
   "ruff",
}

return {
   {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()
         require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
               Lua = {
                  diagnostics = {
                     globals = { "vim", "describe", "it" },
                  },
                  hint = {
                     enable = true,
                  },
               },
            },
         })

         for _, language in pairs(languages) do
            require("lspconfig")[language].setup({
               capabilities = capabilities,
            })
         end

         local symbols =
            { Error = "", Warn = "", Info = "", Hint = "" }
         for name, icon in pairs(symbols) do
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
         end

         local hl_groups = {
            "DiagnosticUnderlineError",
            "DiagnosticUnderlineWarn",
            "DiagnosticUnderlineInfo",
            "DiagnosticUnderlineHint",
         }
         for _, hl in ipairs(hl_groups) do
            vim.cmd.highlight(hl .. " gui=undercurl")
         end
      end,
   },
   {
      "williamboman/mason.nvim",
      opts = {},
   },
   {
      "williamboman/mason-lspconfig.nvim",
      opts = {
         ensure_installed = {
            "lua_ls",
            "clangd",
            "html",
            "cssls",
            "ts_ls",
            "ruff",
         },
      },
   },
}
