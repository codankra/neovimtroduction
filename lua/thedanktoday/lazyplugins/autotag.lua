return {
	"windwp/nvim-ts-autotag",
	event = { "InsertEnter" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "tsx", "jsx" },
		})
	end,
}
