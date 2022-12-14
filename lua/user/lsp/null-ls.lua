local null_ls = SafeRequire("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    formatting.rustfmt.with({extra_args = {"--edition=2018"}}),
    formatting.mix,
    formatting.deno_fmt,
    formatting.fixjson,
    formatting.sql_formatter,
    formatting.terraform_fmt,
    formatting.tidy,
    -- diagnostics.flake8
    diagnostics.yamllint,
	},
})
