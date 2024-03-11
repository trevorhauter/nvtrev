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
  ensure_installed = {'clangd', 'pyright', 'tsserver', 'html'},
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
        cmd = { 'clangd-12', '--background-index' },
        on_attach = function(client, bufnr)
          -- Your custom C/C++ configurations here
          require('lsp_signature').on_attach()  -- Optional: Display function signatures
        end,
      })
    end,

    html = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('lspconfig').html.setup({
        capabilities = capabilities,
      })
    end,

    cssls = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('lspconfig').cssls.setup({
        capabilities = capabilities,
      })
    end,

    tsserver = function()
      require('lspconfig').tsserver.setup({})
    end,



  },
})

-- python language server
--require('lspconfig').pyright.setup({})
-- c++/c language server. (Are they the same? I don't actually know...)
--require('lspconfig').clangd.setup({
    --cmd = { 'clangd-12', '--background-index' },  -- Adjust the version number as needed
    --on_attach = function(client, bufnr)
        -- Your custom C/C++ configurations here
        --require('lsp_signature').on_attach()  -- Optional: Display function signatures
    --end
--})

-- html language server!
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

--require('lspconfig').html.setup {
  --capabilities = capabilities,
--}
--require('lspconfig').cssls.setup {
  --capabilities = capabilities,
--}
--require('lspconfig').tsserver.setup({})
