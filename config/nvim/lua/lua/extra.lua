local M = {}

M.lspkind = function()
  local present, lspkind = pcall(require, "lspkind")
  if present then
    lspkind.init()
  end
end

M.saga = function()
  require("lspsaga").init_lsp_saga({
    -- use_saga_diagnostic_sign = true
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    -- dianostic_header_icon = '   ',
    code_action_icon = "💡",
    code_action_prompt = { enable = true, sign = true, sign_priority = 20, virtual_text = false },
    -- finder_definition_icon = '  ',
    -- finder_reference_icon = '  ',
    -- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = "e",
      vsplit = "v",
      split = "s",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = { quit = "<ESC>", exec = "<CR>" },
  })
end

M.autopairs = function ()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.compe")
	
	if not (present1 or present2) then
    return
	end

  autopairs.setup()
  autopairs_completion.setup({
    map_cr = true,
    map_complete = true -- insert () func completion
  })
end



return M
