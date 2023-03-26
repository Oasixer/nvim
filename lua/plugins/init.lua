return {
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.neo-tree")
    end,
    enabled = true,
  },

  -- Color scheme
  {
    "arturgoms/moonbow.nvim",
  },
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },

  --{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
  -- import any extras modules here
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  -- { import = "lazyvim.plugins.extras.lang.json" },
  -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
  -- import/override with your plugins
  --{ import = "plugins" },
  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.configs.alpha")
    end,
    enabled = true,
  },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  -- { import = "lazyvim.plugins.extras.lang.json" },

  -- Comment stuff
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.configs.comment")
    end,
  },
  {
    "dominikduda/vim_current_word",
    config = function()
      require("plugins.configs.highlight")
    end,
  },
  { -- for camelcasemotion etc
    "chaoren/vim-wordmotion",
    config = function()
      require("plugins.configs.wordmotion")
    end,
  },
  -- Icons
  {
    -- "kyazdani42/nvim-web-devicons",
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.configs.nvim-webdev-icons")
    end,
  },
  { "szw/vim-maximizer" },
  -- Telescope, Fzfinder
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.configs.telescope")
    end,
    enabled = true,
  },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "LinArcX/telescope-env.nvim" },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.configs.project")
    end,
    enabled = true,
  },
  { "ibhagwan/fzf-lua" },

  -- Auto completions
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-nvim-lua" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.configs.cmp")
    end,
  },
  -- Shippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  --
  -- Manage and Install LSP servers
  { "williamboman/mason-lspconfig" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.configs.lsp.mason")
    end,
  },

  -- Config for LSP Servers
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require("plugins.configs.lsp.lspsaga")
    end,
  },
  { "onsails/lspkind.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.lspconfig")
    end,
  },

  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Formatting
  { "jayp0521/mason-null-ls.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.configs.lsp.null-ls")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
  --	{ "JoosepAlviste/nvim-ts-context-commentstring" },
  --	{ "p00f/nvim-ts-rainbow" },
  { "nvim-treesitter/playground" },
  --
  -- Auto closing
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.autopairs")
    end,
  },
  { "windwp/nvim-ts-autotag" },
  --
  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   config = function()
  --     require("plugins.configs.git-blame")
  --   end,
  -- },
  {
    "ruifm/gitlinker.nvim",
    config = function()
      require("plugins.configs.gitlinker")
    end,
  },
  --	{ "mattn/vim-gist" },
  --	{ "mattn/webapi-vim" },
  --
  --	-- Color
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.configs.colorize")
    end,
  },
  --
  -- Sessions TODO: Check the keybinds
  {
    "rmagatti/auto-session",
    config = function()
      require("plugins.configs.auto-session")
    end,
  },
  --
  --	-- UI
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.configs.dressing")
    end,
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins.configs.navic")
    end,
    dependencies = { { "neovim/nvim-lspconfig" } },
  },
  { "kshenoy/vim-signature" },
  --
  --	-- Notification
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.configs.notify")
    end,
  },
  --
  --	-- Smooth scroll
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.configs.neoscroll")
    end,
  },
  --
  --	-- Match up blocks of code TODO: Check keybinds
  -- {
  -- 	"andymass/vim-matchup",
  -- 	config = function()
  -- 		require("plugins.configs.matchup")
  -- 	end,
  -- },
  --
  --	-- Bookmarks
  --	{
  --		"MattesGroeger/vim-bookmarks",
  --		config = function()
  --			require("plugins.configs.bookmark")
  --		end,
  --	},
  --
  --	-- Harpoon
  --	{
  --		"ThePrimeagen/harpoon",
  --		config = function()
  --			require("plugins.configs.harpoon")
  --		end,
  --	},
  --
  --	-- Todo Comment TODO: Check the keybinds
  --	{
  --		"folke/todo-comments.nvim",
  --		config = function()
  --			require("plugins.configs.todo-comments")
  --		end,
  --	},
  --
  --	-- toggle Term TODO: Check the keybinds
  --	{
  --		"akinsho/toggleterm.nvim",
  --		config = function()
  --			require("plugins.configs.toggle-term")
  --		end,
  --	},
  --
  --	-- Vista: Ctags vizualizer TODO: Check the keybinds
  { "liuchengxu/vista.vim" },
  --
  --	-- Impatient optimize the startup time
  { "lewis6991/impatient.nvim" },
  --
  -- Rust
  {
    "simrat39/rust-tools.nvim",
  },
  { "Saecki/crates.nvim" },
  --
  --	-- Spectre: Better find and replace
  {
    "windwp/nvim-spectre",
    config = function()
      require("plugins.configs.spectre")
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("plugins.configs.window-picker")
    end,
  },
  -- Whichkey
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.configs.whichkey")
    end,
  },
  --
  --	-- Diffview
  --	{
  --		"sindrets/diffview.nvim",
  --		config = true,
  --	},
  --
  --	-- Tmux
  --	{
  --		"aserowy/tmux.nvim",
  --		config = true,
  --	},
  --
  --	-- Golang
  --	{
  --		"ray-x/go.nvim",
  --		config = true,
  --	},
  --	{ "ray-x/guihua.lua" },
}
