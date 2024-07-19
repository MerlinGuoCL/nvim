return {
	-- 调试
	{
		"mfussenegger/nvim-dap",
		commit = 'f4a3be57f61893cffa1e22aa5e1e7bded495fcf2',
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim"
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				commit = 'a36982259216afd710f55bcdc220477c74b5bc35',
			},
			{
				"rcarriga/nvim-dap-ui",
				commit = 'b0bc932ce6ca57bdec5536d773ab643e5b2f57ad',
			},
			{
				"Weissle/persistent-breakpoints.nvim",
			},
			{ "nvim-neotest/nvim-nio" },
			{ "nvim-telescope/telescope-dap.nvim" },
		},
		keys = {
			{ "<Leader>'n", function()
				compile()
				require('dap').continue()
			end },
			{ "<Leader>'d", function() require 'telescope'.extensions.dap.configurations {} end },
			{ "<Leader>'sv",      function() require('dap').step_over() end },
			{ "<Leader>'si",      function() require('dap').step_into() end },
			{ "<Leader>'so",      function() require('dap').step_out() end },
			{ '<Leader>b',  function() require('dap').toggle_breakpoint() end },
			{ '<Leader>B',  function() require('dap').set_breakpoint() end },
			{ '<Leader>lp',
				function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
			{ '<Leader>dr', function() require('dap').repl.open() end },
			{ '<Leader>dl', function() require('dap').run_last() end },
			{
				'<Leader>dh',
				function()
					require('dap.ui.widgets').hover()
				end,
				mode = { 'n', 'v' }
			},
			{
				'<Leader>dp',
				function()
					require('dap.ui.widgets').preview()
				end,
				mode = { 'n', 'v' }
			},
			{ '<Leader>df', function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.frames)
			end },
			{ '<Leader>ds', function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.scopes)
			end },
		},
		config = function()
			local breakpoint = require("persistent-breakpoints")

			require("plugins.dap.ui")
			require("plugins.dap.virtual-text")

			local g_config = require("plugins.dap.config")
			local mason_dap = require("mason-nvim-dap")

			vim.fn.sign_define("DapBreakpoint", g_config.defaults.icons.dap.breakpoint)
			vim.fn.sign_define("DapStopped", g_config.defaults.icons.dap.stopped)
			vim.fn.sign_define("DapBreakpointRejected", g_config.defaults.icons.dap.rejected)

			-- 断点持久化
			breakpoint.setup {
				save_dir = vim.fn.stdpath("data") .. "/lazy/persistent-breakpoints.nvim/.cache/",
				perf_record = false,
				load_breakpoints_event = { "BufReadPost" },
			}

			mason_dap.setup({
				-- 下载DAP
				-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
				-- ~/.local/share/nvim/mason/bin/
				ensure_installed = g_config.defaults.extensions.dap,
			})
			require("plugins.dap.providers.python")
			require("plugins.dap.providers.cpptools")
			--require("plugins.dap.providers.codelldb")
		end,
	},
}
