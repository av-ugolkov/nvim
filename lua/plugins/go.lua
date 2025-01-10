return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"mfussenegger/nvim-dap",
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local neotree = require("neo-tree")
		local manager = require("neo-tree.sources.manager")
		local renderer = require("neo-tree.ui.renderer")

		local state = manager.get_state("filesystem")
		local window_exists = false
		require("go").setup()

		-- Настройка клавиш для запуска отладки
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go" },
			callback = function()
				vim.keymap.set('n', '<F5>', function()
					dapui.open({ reset = true })
					local file = vim.fn.expand('%:p')
					dap.run({
						type = 'go',
						name = 'Launch file',
						request = 'launch',
						program = file,
						console = "internalConsole",
						output = "stdout",
					})
				end, { desc = "Launch debugger for the current file" })
				vim.keymap.set('n', '<F4>', function() dap.terminate() end, { desc = "Stop debugger" })
				vim.keymap.set('n', '<F6>', function() dap.continue() end, { desc = "The continue" })
				vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, { desc = "Set/Unset the beakpoint" })
				vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "The step over" })
				vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "The step into" })
				vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "The step out" })

				vim.keymap.set("n", "<C-i>", ":GoImport<CR>", {})
				vim.keymap.set("n", "<C-b>", ":GoBuild %:h<CR>", {})
				vim.keymap.set("n", "<C-t>", ":GoTestPkg<CR>", {})
				vim.keymap.set("n", "<C-c>", ":GoCoverage -p<CR>", {})

				-- Opens test files
				vim.keymap.set("n", "A", ":lua require('go.alternate').switch(true, '')<CR>", {}) -- Test
				vim.keymap.set("n", "V", ":lua require('go.alternate').switch(true, 'vsplit')<CR>", {}) -- Test Vertical
				vim.keymap.set("n", "S", ":lua require('go.alternate').switch(true, 'split')<CR>", {}) -- Test Split

				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
					window_exists = renderer.window_exists(state)
					if window_exists then
						neotree.close_all()
					end
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
					if window_exists then vim.cmd(":Neotree show") end
					window_exists = false
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
					if window_exists then vim.cmd(":Neotree show") end
					window_exists = false
				end
			end
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", 'gomod' },
	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
