local present, _ = pcall(require, "packerinit")
local packer

if present then
  packer = require('packer')
else
	print("fail")
  return false
end

local use = packer.use

return packer.startup(
  function()
    -- packer manages itself
    use { "wbthomason/packer.nvim", opt = true }

    -- dependencies
    use { "nvim-lua/plenary.nvim", event="BufRead" }
    use { "nvim-lua/popup.nvim", after='plenary.nvim' }

    -- theme
    use {
      "folke/tokyonight.nvim",
      config = function()
        require("lua.theme")
      end,
    }

    -- icons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({ default = true })
      end,
    }
    use { "ryanoasis/vim-devicons" }

    -- lsp
    use { "kabouzeid/nvim-lspinstall", event = "BufEnter" }
    use {
      "onsails/lspkind-nvim",
      event = "BufEnter",
      config = function()
        require("lua.extra").lspkind()
      end
    }
    use {
      "glepnir/lspsaga.nvim",
      config = function ()
        require("lua.extra").saga()
      end
    }
    use {
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      wants = "lua-dev.nvim",
      config = function ()
        require("lua.lsp")
      end,
      requires = "folke/lua-dev.nvim"
    }


    -- completion
		use {
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
   	}

   	use {
      "hrsh7th/nvim-cmp",
      after = "friendly-snippets",
      config = function()
         require "lua.compe"
      end,
   	}

   	use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("lua.extra").luasnip()
      end,
   	}

   	use {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
   	}

   	use {
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
   	}

   	use {
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
   	}

   	use {
      "lukas-reineke/cmp-rg",
      after = "cmp-nvim-lsp",
   	}

   	use {
      "hrsh7th/cmp-path",
      after = "cmp-rg",
   	}

   	use {
    	"windwp/nvim-autopairs",
      after = "nvim-cmp",
   	}

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      opt = true,
      event = "BufRead",
      config = function()
        require "lua.treesitter"
      end,
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-textsubjects",
      },
    }

    -- picker
    use {
      "nvim-telescope/telescope.nvim",
      opt = true,
      config = function()
        require("lua.telescope")
      end,
      cmd = { "Telescope" },
      wants = {
        "plenary.nvim",
        "popup.nvim",
        "telescope-fzy-native.nvim",
        "telescope-project.nvim",
        "telescope-symbols.nvim",
      },
      requires = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
      },
    }

    -- statusline
    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
			config = [[require('lua.lualine')]],
      wants = "nvim-web-devicons",
    }

    -- file tree
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("lua.tree")
      end,
    }


    -- indent guides
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("lua.blankline")
      end,
    }


  end
)
