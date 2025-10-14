local function parse_time(str)
	local hour, min = str:match("(%d+):(%d+)")
	return os.time({ year = 1970, month = 1, day = 1, hour = tonumber(hour), min = tonumber(min) })
end

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup()
		local now = os.date("%H:%M")
		if parse_time(now) < parse_time("18:30") then
			vim.cmd.colorscheme("kanagawa-lotus")
    else
      vim.cmd.colorscheme("kanagawa-dragon")
		end
	end,
}
