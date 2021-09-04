local gcc = vim.fn.getenv("NIX_GCC")

if gcc and gcc ~= vim.NIL then
  require("nvim-treesitter.install").compilers = { gcc }
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = false },
  context_commentstring = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}
