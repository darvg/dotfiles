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
map("n", "<leader>lh", ":Lspsaga hover_doc<CR>", opt)
--map("i", "<leader>ls", "<Cmd>Lspsaga signature_help<CR>", opt)


--------------------------
--      nvim-compe      --
--------------------------


--------------------------
--      Telescope       --
--------------------------
map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", opt)
map("n", "<leader>pg", "<cmd>Telescope live_grep<cr>", opt)
map("n", "<leader>pb", "<cmd>Telescope buffers<cr>", opt)
map("n", "<leader>ph", "<cmd>Telescope help_tags<cr>", opt)
map("n", "<leader>pr", "<cmd> Telescope file_browser<cr>", opt)

--------------------------
--       Splitting      --
--------------------------
map("n", "<leader>sv", "<cmd>vsplit<cr>", opt)
map("n", "<leader>sh", "<cmd>split<cr>", opt)

