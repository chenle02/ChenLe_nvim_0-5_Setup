local M = {}
local api = vim.api
function M.makeScratch()
	api.nvim_command('enew')
	vim.bo[0].buftype=nofile
	vim.bo[0].bufhidden=hide
	vim.bo[0].swapfile=false
end
return M
