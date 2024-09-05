return {
	"goolord/alpha-nvim",
	--  lazy = true,
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)

		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[ ,---,---,---,---,---,---,---,---,---,---,---,---,---,-------,]],
			[[| ~ | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | [ | ] | <-     |]],
			[[|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,------|]],
			[[| ->| | Q | W | R | T | Y | U | I | O | P | [ | ] | = |  \\  |]],
			[[|-----',--',--',--',--',--',--',--',--',--',--',--',--'------|]],
			[[| Caps | A | S | D | F | G | H | J | K | L | ; | " |  Enter  |]],
			[[|------'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---------|]],
			[[|        | Z | X | C | V | B | N | M | < | > | ? |           |]],
			[[|------,-',--'--,'---'---'---'---'---'---'-,-'---',--,-------|]],
			[[| ctrl |  | alt |                          | alt  |  | ctrl  |]],
			[['------'--'-----'--------------------------'------'--'-------']],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "󰮗  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("s", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			return "Don't Stop Until You are Proud..."
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
