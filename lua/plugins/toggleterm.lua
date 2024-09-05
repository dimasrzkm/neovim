return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- size can be a number or function which is passed the current terminal
			size = function(term)
				if term.direction == "horizontal" then
					return 10
				elseif term.direction == "vertical" then
					return 50
				end
			end,
			open_mapping = [[<c-\>]], -- Kombinasi tombol untuk toggle terminal
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal", -- Pilihan: 'horizontal', 'vertical', atau 'tab'
			close_on_exit = true,
		})

		-- key map untuk memilih terminal yang aktif
		vim.keymap.set("n", "<C-t>", ":TermSelect<CR>", {})
		-- key map untuk mengatur terminal (horizonal/vertical)
		vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", {})
		vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", {})
		vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>", {})
		-- key map untuk keluar dari mode terminal ke mode normal
		vim.keymap.set("t", "<C-w>", "<C-\\><C-n>", { noremap = true, silent = true })

		-- key map untuk membuat terminal baru secara otomatis
		-- Variabel global untuk menyimpan nilai count
		_G.toggleterm_count = 1

		-- Fungsi untuk menginkremen nilai count dan menjalankan ToggleTerm
		function _G.toggleterm_with_increment()
			-- Menginkremen nilai count
			_G.toggleterm_count = _G.toggleterm_count + 1

			-- Menjalankan perintah ToggleTerm dengan nilai count yang diperbarui
			vim.cmd("exe " .. _G.toggleterm_count .. ' . "ToggleTerm"')
		end

		-- Pemetaan key untuk menjalankan fungsi
		vim.keymap.set(
			"n", -- Mode normal
			"<C-n>", -- Kombinasi tombol
			_G.toggleterm_with_increment, -- Fungsi yang dijalankan
			{ noremap = true, silent = true } -- Opsi mapping
		)
	end,
}
