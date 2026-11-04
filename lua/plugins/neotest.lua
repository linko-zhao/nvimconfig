return {
	"nvim-neotest/neotest",
	dependencies = {
		"fredrikaverpil/neotest-golang",
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
	},
	opts = function()
		return {
			adapters = {
				require("neotest-golang")({
					runner = "gotestsum",
				}),
			},
			status = { virtual_text = true },
			output = { open_on_run = true },
		}
	end,
	keys = {
		{
			"<leader>tt",
			function()
				vim.cmd("wa") -- 运行前保存所有文件
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File (Neotest)",
		},
		{
			"<leader>tT",
			function()
				vim.cmd("wa")
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "Run All Test Files (Neotest)",
		},
		{
			"<leader>tr",
			function()
				vim.cmd("wa")
				require("neotest").run.run()
			end,
			desc = "Run Nearest (Neotest)",
		},
		{
			"<leader>tl",
			function()
				vim.cmd("wa")
				require("neotest").run.run_last()
			end,
			desc = "Run Last (Neotest)",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ last_run = true, enter = true })
			end,
			desc = "Open Last Test Output",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Test Summary",
		},
	},
}
