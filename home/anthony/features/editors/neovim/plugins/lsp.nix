{ pkgs, lib }:
{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
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

    local lspconfig = require "lspconfig"

    local base_opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.bashls.setup(base_opts)
    lspconfig.cssls.setup(base_opts)
    -- lspconfig.cssmodules_ls.setup(base_opts)
    lspconfig.docker_compose_language_service.setup(base_opts)
    lspconfig.dockerls.setup(base_opts)
    -- lspconfig.emmet_ls.setup(base_opts)

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
        on_attach(client, bufnr)
      end,
    })

    -- lspconfig.gdscript.setup(base_opts)
    lspconfig.html.setup(base_opts)
    lspconfig.jsonls.setup(base_opts)

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })

    lspconfig.nil_ls.setup(base_opts)

    lspconfig.solargraph.setup(base_opts)
    -- lspconfig.sqlls.setup(base_opts)
    lspconfig.tsserver.setup(base_opts)
  '';
}
