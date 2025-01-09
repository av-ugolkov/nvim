return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{
			"leoluz/nvim-dap-go",
			config = function()
				require("dap-go").setup()
			end,
		},
	},
	config = function()
		local dap = require('dap')
		local dap_go = require('dap-go')
		local dapui = require('dapui')

		-- Инициализация dap-go
		dap_go.setup()

		-- Инициализация dap-ui (опционально)
		dapui.setup({
			icons = { expanded = '▾', collapsed = '▸' },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.5 },
						-- { id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.5 },
						-- { id = "watches",     size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl",    size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			controls = {
				enabled = true,
				element = "repl",
			},
		})

		-- Функция для загрузки launch.json
		local function load_launch_json()
			local project_root = vim.fn.getcwd() -- Текущая рабочая директория
			local file_path = project_root .. '/.nvim/launch.json'

			if vim.fn.filereadable(file_path) == 1 then
				local file = io.open(file_path, 'r')

				if file ~= nil then
					local content = file:read('*a')
					file:close()
					local ok, configurations = pcall(vim.json.decode, content)
					if ok and configurations.configurations then
						dap.configurations.go = configurations.configurations
						print("launch.json was loaded from " .. file_path)
					else
						print("The mistakes was found in launch.json")
					end
				end
			else
				print("launch.json didn't found in " .. file_path)
			end
		end

		-- Загрузка конфигурации при старте Neovim
		load_launch_json()

		-- Возможность перезагрузить конфигурацию вручную
		vim.keymap.set('n', '<Leader>rl', load_launch_json, { desc = "Reload launch.json" })
	end,
}
