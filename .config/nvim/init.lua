vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.keymap.set("n", "<leader>rr", vim.lsp.buf.format, { desc = "Reformat buffer" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>pv", "<cmd>:Ex<CR>", { desc = "Exit to file manager" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Error messages" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "No highlint" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/lambdalisue/vim-suda" },
})

require("rose-pine").setup({
	styles = {
		transparency = true,
	},
	highlight_groups = {
		NormalFloat = { bg = "base" },
		FloatBorder = { bg = "base" },
	},
})

vim.cmd.colorscheme("rose-pine-moon")

require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = {
		"lua_ls",
		"bashls",
		"gopls",
		"omnisharp",
		"intelephense",
		"hyprls",
		"dockerls",
		"docker_compose_language_service",
		"html",
		"ts_ls",
		"clangd",
		"basedpyright",
		"zls",
		"cssls",
	},
})

vim.diagnostic.config({
	virtual_lines = false,
})

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"gopls",
	"omnisharp",
	"intelephense",
	"hyprls",
	"dockerls",
	"docker_compose_language_service",
	"html",
	"ts_ls",
	"clangd",
	"basedpyright",
	"zls",
	"cssls",
})

require("mini.pick").setup({})
require("mini.surround").setup({})
require("mini.pairs").setup({})
require("mini.statusline").setup({})

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
})

require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	completion = {
		documentation = { auto_show = true },
		ghost_text = {
			enabled = true,
		},
	},
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
		prebuilt_binaries = {
			download = true,
		},
	},
})
