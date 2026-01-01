local map = vim.keymap.set

map({ "i", "t" }, "<C-BS>", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    if col == 0 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, false, true), "n", false)
        return
    end

    local start = col
    local left = line:sub(1, col)

    if left:sub(-1):match("%s") then
        start = left:find("%s*$") or col
    else
        start = left:find("%w+$") or left:find("[^%w%s]+$") or col
    end

    vim.api.nvim_buf_set_text(
        0,
        row - 1,
        start - 1,
        row - 1,
        col,
        {}
    )
end)


map("v", "<BS>", [["_d]])
map("v", "<Del>", [["_d]])

