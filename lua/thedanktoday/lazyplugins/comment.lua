return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local comment = require("Comment")

			comment.setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

				-- Optional: you can customize keybindings here
				-- For example:
				-- toggler = {
				--   line = 'gcc',
				--   block = 'gbc',
				-- },
				-- opleader = {
				--   line = 'gc',
				--   block = 'gb',
				-- },
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		config = function()
			require("ts_context_commentstring").setup({})
		end,
	},
}
