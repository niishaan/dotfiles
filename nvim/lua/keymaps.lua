vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right toggle<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")

--format
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})

vim.keymap.set("n", "<m-tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<m-w>", ":BufferLinePickClose<CR>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

-- Diagnostic configuration with both inline virtual text and floating window
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Customize the symbol shown for inline diagnostics
		spacing = 2, -- Space between diagnostic and code
	},
	float = {
		source = "always", -- Show the source of the diagnostic in floating window
		border = "rounded", -- Rounded border for floating window
	},
	severity_sort = true, -- Sort diagnostics by severity level
})

-- Keymap to show diagnostics in a floating window at the cursor position
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
