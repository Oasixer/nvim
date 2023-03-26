local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

--vim.keymap.del("n", "<leader>fn")

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 1, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
  --unique = true,
}

local noprefix_opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  ["y"] = { '"+y', "Yank Clipboard" },
  ["p"] = { '"+p', "Put Clipboard" },
  ["c"] = { "<cmd>close<cr>", "Close" },
  ["o"] = { "<cmd>tabn<cr>", "Next tab" },
  ["i"] = { "<cmd>tabp<cr>", "Prev tab" },

  w = {
    name = "Window",
    v = { "<C-w>v", "Vertical Split" },
    h = { "<C-w>s", "Horizontal Split" },
    e = { "<C-w>=", "Make Splits Equal" },
    c = { ":close<CR>", "Close Split" },
    m = { ":MaximizerToggle<CR>", "Toggle Maximizer" },
  },
  --	["b"] = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  --	["e"] = { "<cmd>Neotree toggle<cr>", "Explorer" },
  ["q"] = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
  --	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  --	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  --	["gy"] = "Open code in Browser",
  -- ["."] = "Goto next harpoon",
  -- [","] = "Goto next harpoon",

  --	u = {
  --		name = "TodoComments",
  --		["t"] = { "<cmd>TodoTelescope<CR>", "Show Comments" },
  --		["q"] = { "<cmd>TodoQuickFix<CR>", "Quick Fix" },
  --		["l"] = { "<cmd>TodoLocList<CR>", "List Comments" },
  --	},

  --	B = {
  --		name = "Bookmarks",
  --		a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  --		c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  --		t = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  --		m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  --		n = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon Toggle" },
  --		l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  --		j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  --		s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  --		k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  --		S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
  --		x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  --	},

  L = {
    name = "Lazy",
    c = { "<cmd>Lazy check<cr>", "Check" },
    C = { "<cmd>Lazy clean<cr>", "Clean" },
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    r = { "<cmd>Lazy restore<cr>", "Restore" },
    l = { "<cmd>Lazy<cr>", "Lazy" },
  },

  O = {
    name = "Options",
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
  },

  s = {
    name = "Session",
    s = { "<cmd>SaveSession<cr>", "Save" },
    r = { "<cmd>RestoreSession<cr>", "Restore" },
    x = { "<cmd>DeleteSession<cr>", "Delete" },
    f = { "<cmd>Autosession search<cr>", "Find" },
    d = { "<cmd>Autosession delete<cr>", "Find Delete" },
  },

  --	r = {
  --		name = "Replace",
  --		r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  --		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  --		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
  --	},
  --
  --	d = {
  --		name = "Debug",
  --		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  --		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  --		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
  --		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
  --		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
  --		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  --		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
  --		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  --		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  --	},

  f = {
    name = "Find",
    p = { "<cmd>lua require('telescope').load_extension('command_palette')<cr>", "Palette" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    [" "] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live grep (find text)" },
    ["t"] = {
      -- "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_dropdown())<cr>",
      "Live grep raw",
    },
    s = { "<cmd>Telescope grep_string theme=ivy<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    n = { "<cmd>Telescope notify<cr>", "Show notifications" },
  },
  --
  --	g = {
  --		name = "Git",
  --		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  --		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  --		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  --		l = { "<cmd>GitBlameToggle<cr>", "Blame" },
  --		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  --		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  --		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  --		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  --		u = {
  --			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
  --			"Undo Stage Hunk",
  --		},
  --		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  --		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  --		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  --		d = {
  --			"<cmd>Gitsigns diffthis HEAD<cr>",
  --			"Diff",
  --		},
  --
  --		G = {
  --			name = "Gist",
  --			a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
  --			d = { "<cmd>Gist -d<cr>", "Delete" },
  --			f = { "<cmd>Gist -f<cr>", "Fork" },
  --			g = { "<cmd>Gist -b<cr>", "Create" },
  --			l = { "<cmd>Gist -l<cr>", "List" },
  --			p = { "<cmd>Gist -b -p<cr>", "Create Private" },
  --		},
  --	},
  --
  -- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  -- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  l = {
    name = "LSP",
    -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }, -- for suggested actions like vscode to fix a diagnostic
    --                                                                   -- possibly also includes refactors??
    -- d = { "<cmd>Telescope lsp_definitions<cr>" },
    -- keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- go to implementation
    --
    --
    -- conventions for unambiguity:
    --
    g = {
      name = "Goto",
      -- g = { "<cmd>Lspsaga goto_definition<CR>", "Goto ?)" },
      [" "] = { "<cmd>Lspsaga goto_definition<CR>", "Goto definition" },
      t = { "<cmd>Lspsaga goto_type_definition<CR>", "Goto type definition" },
      e = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Telescope implementations" },
    },
    p = {
      name = "Peek",
      [" "] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
      t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek type definition" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Telescope implementations" },
    },
    d = {
      name = "Diagnostics",
      h = { '<cmd>lua require("user.functions").hide_diagnostics()<cr>', "Hide Diagnostics" },
      s = { '<cmd>lua require("user.functions").show_diagnostics()<cr>', "Show Diagnostics" },
      t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
      n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostic" },
      p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Jump to prev diagnostic" },
      f = { "<cmd>Telescope diagnostics<cr>", "Telescope diagnostics" },
      l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
    },
    f = {
      name = "Telescope",
      r = { "<cmd>Telescope lsp_references<cr>", "Telescope references" },
      [" "] = { "<cmd>Telescope lsp_definitions<cr>", "Telescope definitions" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Telescope implementations" },
    },
    -- ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
    -- ["Df"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Floating " },

    ["R"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    --["u"] = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    -- diagnostics
    --w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    --t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
    --n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "next diagnostic" },
    -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

    -- autoformat
    --f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    --F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    --i = { "<cmd>LspInfo<cr>", "Info" },
    --
    -- other
    --h = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" }, -- not installed
    --I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    --j = {
    --  "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
    --  "Next Diagnostic",
    --},
    --k = {
    --  "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    --  "Prev Diagnostic",
    --},
    --l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    --q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    --s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }, -- list of symbols in document
    --S = {
    --  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --  "Workspace Symbols",
    --}, -- idk, seems broken
    --u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
  },

  --	S = {
  --		name = "SnipRun",
  --		c = { "<cmd>SnipClose<cr>", "Close" },
  --		f = { "<cmd>%SnipRun<cr>", "Run File" },
  --		i = { "<cmd>SnipInfo<cr>", "Info" },
  --		m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
  --		r = { "<cmd>SnipReset<cr>", "Reset" },
  --		t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
  --		x = { "<cmd>SnipTerminate<cr>", "Terminate" },
  --	},
  --
  --	t = {
  --		name = "Terminal",
  --		["1"] = { ":1ToggleTerm<cr>", "1" },
  --		["2"] = { ":2ToggleTerm<cr>", "2" },
  --		["3"] = { ":3ToggleTerm<cr>", "3" },
  --		["4"] = { ":4ToggleTerm<cr>", "4" },
  --		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
  --		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
  --		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
  --		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
  --		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  --		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  --		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  --	},
  --
  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
    r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

local noprefix_norm = {
  ["<C-n>"] = { "<cmd>Neotree toggle<cr>", "Nerdtree toggle" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(noprefix_norm, noprefix_opts)
which_key.register(vmappings, vopts)
