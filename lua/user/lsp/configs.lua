local lsp_installer = SafeRequire("nvim-lsp-installer")

local lspconfig = require("lspconfig")

local servers = { "solidity_ls",
  "marksman",
  "emmet_ls",
  "jsonls",
  "yamlls",
  "sumneko_lua",
  "rust_analyzer",
  "denols",
  "tsserver",
  "elixirls",
  "html",
  "jedi_language_server",
  "pyright",
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
