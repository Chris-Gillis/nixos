vim.opt.colorcolumn = "80"

-- Load providers
local enable_providers = {
  "python3_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

vim.cmd([[
runtime plugin/rplugin.vim
UpdateRemotePlugins
]])
