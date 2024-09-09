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
	end,
}
