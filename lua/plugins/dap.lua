return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		-- dap.set_log_level('DEBUG')

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
	end
}
