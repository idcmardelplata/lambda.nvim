return { "jose-elias-alvarez/null-ls.nvim",
config = function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  null_ls.setup({
    debug = false,
    sources = {
      formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.stylua,
      formatting.mix,
      formatting.rustfmt.with({extra_args = {"--edition=2018"}}),
      formatting.deno_fmt,
      formatting.fixjson,
      formatting.sql_formatter,
      formatting.terraform_fmt,
      formatting.tidy,
      -- diagnostics.flake8
      diagnostics.yamllint,
    },
  })
end
} -- for formatters and linters
