local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'emmet_ls', 'jdtls', 'pyright', 'tsserver', },
  handlers = {
    lsp_zero.default_setup,

    emmet_ls = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('lspconfig').emmet_ls.setup({
        capabilities = capabilities,
      })
    end,

    -- For more features, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
    jdtls = function()
        require('lspconfig').jdtls.setup({})
    end,

    pyright = function()
      require('lspconfig').pyright.setup({
        settings = {
          python = {
            analysis = {
              reportMissingTypeStubs = false,
              typeCheckingMode = "off",
            },
          },
        },
      })
    end,
    
    
    tsserver = function()
      require('lspconfig').tsserver.setup({})
    end,

  },
})

