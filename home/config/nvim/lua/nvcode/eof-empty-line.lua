vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()

		if not vim.api.nvim_get_option_value("modifiable", { buf = buf }) then
			return
		end

		local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
		local last_nonempty = 0

		for i = #lines, 1, -1 do
			if lines[i]:match("%S") then
				last_nonempty = i
				break
			end
		end

		if last_nonempty == #lines - 1 and lines[#lines] == "" then
			return
		end

		pcall(vim.cmd, "undojoin")

		vim.api.nvim_buf_set_lines(buf, last_nonempty, -1, false, {})
		vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "" })
	end,
})

