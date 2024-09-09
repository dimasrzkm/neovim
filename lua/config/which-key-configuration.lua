local wk = require("which-key")
-- variable for telescope
local builtin = require("telescope.builtin")

wk.add({
	-- Telespoce
	{ "<C-p>", builtin.find_files, desc = "Find File", mode = "n" },
	{ "<leader>sl", builtin.live_grep, desc = "Search Live", mode = "n" },
	-- Emmet
	{
		"<leader>ei",
		require("nvim-emmet").wrap_with_abbreviation,
		desc = "Emmet Insert Tag",
		mode = { "n", "v" },
	},
	-- Neotree
	{ "<leader>nt", ":Neotree filesystem reveal right toggle<CR>", desc = "Toggle Filesystem", mode = "n" },
	{ "<leader>nf", ":Neotree focus<CR>", desc = "NeoTree Focus to Filesystem", mode = "n" },
	-- none-ls formating
	{ "<leader>ff", vim.lsp.buf.format, desc = "Formating File", mode = "n" },
	-- toggleterm
	{ "<leader>ts", ":TermSelect<CR>", desc = "Select Terminal", mode = "n" },
	{ "<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "Terminal Vertical Mode", mode = "n" },
	{ "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Terminal Horizontal Mode", mode = "n" },
	{ "<leader>ta", ":ToggleTermToggleAll<CR>", desc = "Show All Terminal", mode = "n" },
	{
		"<C-w>",
		"<C-\\><C-n>",
		desc = "Close Terminal Mode",
		mode = "t",
		{ noremap = true, silent = true },
	},
	{
		"<leader>tn",
		"<cmd>lua _G.toggleterm_with_increment()<CR>",
		mode = "n",
		desc = "New Terminal",
		{ noremap = true, silent = true },
	},
	{ "<leader>tN", ":tabnew<CR>", desc = "New Tab", mode = "n" },
	{ "<leader>tW", ":tabclose<CR>", desc = "Close Tab", mode = "n" },
	{
		"<leader>tc",
		function()
			local bufnum = vim.fn.getchar() -- Mengambil input pengguna
			if bufnum >= 48 and bufnum <= 57 then -- Memeriksa jika input adalah karakter angka
				bufnum = bufnum - 48 -- Mengonversi nilai ASCII ke angka

				-- Periksa jika tab dengan nomor ini ada
				if bufnum > 0 and bufnum <= vim.fn.tabpagenr("$") then
					-- Mengubah perintah ke bentuk :TabNext atau :buffer
					local cmd = "tabnext " .. bufnum
					-- Eksekusi perintah untuk berpindah ke buffer
					vim.cmd(cmd)
				else
					print("Tab tidak ada!")
				end
			else
				print("Masukan angka")
			end
		end,
		mode = "n",
		desc = "Choose Tab",
		{ noremap = true, silent = true },
	},
	-- lsp-config
	{ "H", vim.lsp.buf.hover, desc = "LSP Buffer", mode = "n" },
	{ "<leader>gd", vim.lsp.buf.definition, desc = "LSP Get Definition", mode = "n" },
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action", mode = { "n", "v" } },
})
