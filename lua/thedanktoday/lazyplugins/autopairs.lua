return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})

		-- Make autopairs and completion work together
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Add support for JSX/TSX
		local Rule = require("nvim-autopairs.rule")
		local ts_conds = require("nvim-autopairs.ts-conds")

		autopairs.add_rules({
			Rule("{", "}", { "typescript", "typescriptreact", "javascript", "javascriptreact" }):with_pair(
				ts_conds.is_not_ts_node({ "string", "comment" })
			),
		})
	end,
}
