{ pkgs, lib }:
{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  type = "lua";
  config = ''
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
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
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })
    -- lspconfig.cssmodules_ls.setup(base_opts)
    lspconfig.docker_compose_language_service.setup(base_opts)
    lspconfig.dockerls.setup(base_opts)
    lspconfig.dotls.setup(base_opts)
    lspconfig.emmet_ls.setup(base_opts)

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

    lspconfig.gdscript.setup(base_opts)
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

    lspconfig.solargraph.setup(base_opts)
    lspconfig.sqlls.setup(base_opts)
    lspconfig.tailwindcss.setup(base_opts)
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      before_init = function(params)
        params.processId = vim.NIL
      end,
      on_new_config = function(new_config, new_root_dir)
        if new_root_dir:match("amplify/client$") then
          new_config.cmd = require("lspcontainers").command(
            'tsserver',
            {
              root_dir = new_root_dir,
              docker_volume = "client_node_modules",
              cmd_builder = function(runtime, workdir, image, network, docker_volume)
                local mnt_volume = "--volume="..workdir..":"..workdir..":z"
                local node_volume = "--volume="..docker_volume..":"..workdir.."/node_modules:z"
                return {
                  runtime,
                  "container",
                  "run",
                  "--interactive",
                  "--rm",
                  "--network="..network,
                  "--workdir="..workdir,
                  mnt_volume,
                  node_volume,
                  image
                }
              end,
            }
          )
        end
      end,
    })

    -- keybinds
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        f = {
          function()
            vim.diagnostic.open_float { border = "rounded" }
          end,
          "floating diagnostic"
        },
        ls = {
          function()
            vim.lsp.buf.signature_help()
          end,
          "LSP signature help"
        },
        D = {
          function()
            vim.lsp.buf.type_definition()
          end,
          "LSP type definition"
        },
        ra = {
          function()
            vim.lsp.buf.rename()
          end,
          "LSP rename"
        },
        ca = {
          function()
            vim.lsp.buf.code_action()
          end,
          "LSP code action"
        },
      },
      g = {
        D = {
          function()
            vim.lsp.buf.declaration()
          end,
          "LSP declaration"
        },
        d = {
          function()
            vim.lsp.buf.definition()
          end,
          "LSP definition"
        },
        i = {
          function()
            vim.lsp.buf.implementation()
          end,
          "LSP implementation"
        }
      },
      K = {
        function()
          vim.lsp.buf.hover()
        end,
        "LSP hover",
      },
    })
  '';
}
