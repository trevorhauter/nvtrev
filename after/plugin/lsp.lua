local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

  --if client.name == 'pyright' then
    --client.config.settings.python.analysis.reportMissingTypeStubs = false
    --client.config.settings.python.analysis.typeCheckingMode = "off"
  --end

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'omnisharp_mono', 'pyright', 'tsserver', 'emmet_ls'},
  handlers = {
    lsp_zero.default_setup,

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
    
    clangd = function()
      require('lspconfig').clangd.setup({
        on_attach = function(client, bufnr)
          -- Your custom C/C++ configurations here
          require('lsp_signature').on_attach()  -- Optional: Display function signatures
        end,
      })
    end,

    emmet_ls = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('lspconfig').emmet_ls.setup({
        capabilities = capabilities,
      })
    end,

    tsserver = function()
      require('lspconfig').tsserver.setup({})
    end,

    omnisharp_mono = function()
      require('lspconfig').omnisharp_mono.setup({})
    end,

  },
})

