return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Explorer NeoTree (Root Dir)",
		},
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git Explorer",
		},
	},
	opts = {
		filesystem = {
			follow_current_file = { enabled = true },
		},
		window = {
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["P"] = { "toggle_preview", config = { use_float = false } },
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
			git_status = {
				symbols = { unstaged = "", staged = "" },
			},
		},
	},
}
