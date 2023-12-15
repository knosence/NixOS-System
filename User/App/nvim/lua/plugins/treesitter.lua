return {
	"nvim-treesitter/nvim-treesitter",
	bulid = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				typescript,
				tsx,
				lua,
				astro,
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
