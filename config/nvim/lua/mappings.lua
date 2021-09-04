local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

--------------------------
--      nvim-tree       --
--------------------------
map("n", "<leader>nt", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", opt)
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", opt)


--------------------------
--       lspsaga        --
--------------------------
map("n", "<silent>nf", ":Lspsaga hover_doc<CR>", opt)
map("i", "<silent> <C-k>", "<Cmd>Lspsaga signature_help<CR>", opt)


--------------------------
--      nvim-compe      --
--------------------------
local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<silent><expr> <CR>", "compe#confirm('<CR>')", opt)
map("i", "<silent><expr> <C-e>", "compe#close('<C-e>')", opt)


--------------------------
--      Telescope       --
--------------------------
map("n", "<leader>tf", "<cmd>Telescope find_files<cr>", opt)
map("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opt)
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opt)
map("n", "<leader>th", "<cmd>Telescope help_tags<cr>", opt)
map("n", "<leader>tr", "<cmd> Telescope file_browser<cr>", opt)
