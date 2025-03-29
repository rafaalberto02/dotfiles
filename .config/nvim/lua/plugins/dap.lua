return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local dap = require("dap")
		local widgets = require("dap.ui.widgets")

		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>dso", dap.step_over)
		vim.keymap.set("n", "<leader>dsi", dap.step_into)
		vim.keymap.set("n", "<leader>dsO", dap.step_out)

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dB", dap.set_breakpoint)

		vim.keymap.set("n", "<Leader>dr", dap.repl.open)
		vim.keymap.set("n", "<Leader>dl", dap.run_last)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", widgets.hover)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", widgets.preview)

		vim.keymap.set("n", "<Leader>df", function()
			widgets.centered_float(widgets.frames)
		end)

		vim.keymap.set("n", "<Leader>ds", function()
			widgets.centered_float(widgets.scopes)
		end)

		vim.keymap.set("n", "<leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)

		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.exepath("netcoredbg"),
			args = { "--interpreter=vscode" },
		}

		vim.g.dotnet_build_project = function()
			local default_path = vim.fn.getcwd() .. "/"

			if vim.g["dotnet_last_proj_path"] ~= nil then
				default_path = vim.g["dotnet_last_proj_path"]
			end

			local path = vim.fn.input("Path to your *proj file ", default_path, "file")

			vim.g["dotnet_last_proj_path"] = path

			local cmd = "dotnet build -c Debug --source " .. path .. " --output bin/Debug > /dev/null"

			print("")
			print("Cmd to execute: " .. cmd)

			local f = os.execute(cmd)

			if f == 0 then
				print("\nBuild: ✔️ ")
			else
				print("\nBuild: ❌ (code: " .. f .. ")")
			end
		end

		vim.g.dotnet_get_dll_path = function()
			local request = function()
				return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
			end

			if vim.g["dotnet_last_dll_path"] == nil then
				vim.g["dotnet_last_dll_path"] = request()
			else
				if
					vim.fn.confirm(
						"Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"],
						"&yes\n&no",
						2
					) == 1
				then
					vim.g["dotnet_last_dll_path"] = request()
				end
			end

			return vim.g["dotnet_last_dll_path"]
		end

		local config = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
						vim.g.dotnet_build_project()
					end
					return vim.g.dotnet_get_dll_path()
				end,
			},
		}

		dap.configurations.cs = config
	end,
}
