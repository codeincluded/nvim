-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
})

-- auto close
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

-- open the file upon creation
local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
    vim.cmd("edit " .. file.fname)
end)

local nvimTreeFocusOrToggle = function ()
	local nvimTree=require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus()
	end
end

vim.keymap.set("n", "<A-1>", nvimTreeFocusOrToggle)

