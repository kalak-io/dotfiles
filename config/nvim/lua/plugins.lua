--****************************************************************************** 
-- PLUGINS.LUA
--****************************************************************************** 

require("lazy").setup({
  -- Colorscheme NeoSolarized
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[ colorscheme NeoSolarized ]]
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "vue", "javascript", "html", "css", "python", "dockerfile", "make", "bash" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
  },
  -- Show color in CSS
  {
    "nvim-highlight-colors",
  },
  -- Git gutter
  {
    "airblade/vim-gitgutter",
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },
  -- Fugitive
  {
    "tpope/vim-fugitive"
  },
  -- lspsaga
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    }
  },
  -- nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    opts = {
      autotag = {
        enable = true,
        enable_rename = true
      }
    },
  },
  -- DelimitMate
  {
    "raimondi/delimitmate"
  },
  -- Vim Visual Multi
  {
    "mg979/vim-visual-multi"
  },
  -- Codeium
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter'
  },
  --Comment
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  }
})

