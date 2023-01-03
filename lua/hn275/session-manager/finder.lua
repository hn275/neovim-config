local picker = require("telescope.pickers")
local finder = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local theme = require("telescope.themes").get_cursor

SESSION_DIR = vim.fn.stdpath("data") .. "/sessions"

local telescope = function(title, callback)
	local all_sessions = {}

	local handle = io.popen("ls " .. SESSION_DIR)

	if handle ~= nil then
		local sessions = handle:read("*a"):gmatch("([^\n]+)")
		for session in sessions do
			table.insert(all_sessions, session)
		end
	end

	(function(opts)
		local config = opts or {}
		picker
			.new(config, {
				prompt_title = title,
				finder = finder.new_table({
					results = all_sessions,
				}),
				sorter = conf.generic_sorter(config),
				attach_mappings = function(prompt_bufnr)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local entry = action_state.get_selected_entry()
						local query = action_state.get_current_line()

						if entry ~= nil then
							callback(entry[1], nil)
						else
							callback(nil, query)
						end
					end)
					return true
				end,
			})
			:find()
	end)(theme({}))
end

M = {}

M.find_session = function()
	telescope("Find session", function(session, _)
		vim.cmd(("silent source %s/%s"):format(SESSION_DIR, session))
		print(("sourced session: %s"):format(session))
	end)
end

M.delete_session = function()
	telescope("Delete session", function(session, _)
		vim.cmd(("silent !rm -rf %s/%s"):format(SESSION_DIR, session))
		print(("Deleted session: %s"):format(session))
	end)
end

M.new_session = function()
	telescope("Save session", function(session, query)
		if session ~= nil then
			vim.cmd(("silent mksession! %s/%s"):format(SESSION_DIR, session))
			print(("Session overloaded: %s"):format(session))
		else
			vim.cmd(("silent mksession! %s/%s"):format(SESSION_DIR, query))
			print(("Created session: %s"):format(query))
		end
	end)
end

M.last_session = function()
	vim.cmd(("silent source %s/%s"):format(SESSION_DIR, ".cache_session.vim"))
	print("Sourced cached session.")
end

return M
