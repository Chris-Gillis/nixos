{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.rust-tools-nvim;
  type = "lua";
  config = ''
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- load mappings
      vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float, { buffer = bufnr })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    require('rust-tools').setup({
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              enable = true,
              command = "check",
              extraArgs = {
                "--target-dir", "/home/anthony/.rust-analyzer",
              }
            }
          }
        }
      }
    })
  '';
}
