local map = vim.keymap.set

vim.opt.whichwrap:append("<,>,[,]")

local function handle_arrow(direction)
    local start_row, start_col = vim.fn.line("v"), vim.fn.col("v")
    local end_row, end_col = vim.fn.line("."), vim.fn.col(".")

    if start_row > end_row or (start_row == end_row and start_col > end_col) then
        start_row, end_row = end_row, start_row
        start_col, end_col = end_col, start_col
    end

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    if direction == "right" then
        vim.api.nvim_win_set_cursor(0, {end_row, end_col - 1})
    else -- left
        vim.api.nvim_win_set_cursor(0, {start_row, start_col - 1})
    end

    vim.api.nvim_feedkeys("i", "n", false)
end

local function handle_vertical(direction)
    local sr, sc = vim.fn.line("v"), vim.fn.col("v")
    local er, ec = vim.fn.line("."), vim.fn.col(".")

    if sr > er then
        sr, er = er, sr
        sc, ec = ec, sc
    end

    local last_line = vim.fn.line("$")

    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
        "n",
        false
    )

    if direction == "up" then
        local target_line = sr - 1
        if target_line < 1 then
            target_line = 1
        end
        vim.api.nvim_win_set_cursor(0, { target_line, sc - 1 })
    else -- down
        local target_line = er + 1
        if target_line > last_line then
            target_line = last_line
        end
        vim.api.nvim_win_set_cursor(0, { target_line, ec - 1 })
    end

    vim.api.nvim_feedkeys("i", "n", false)
end



map("v", "<Left>", function() handle_arrow("left") end)
map("v", "<Right>", function() handle_arrow("right") end)
map("v", "<Up>",   function() handle_vertical("up") end)
map("v", "<Down>", function() handle_vertical("down") end)

map("i", "<Home>", "<C-o>^")
map("i", "<End>",  "<C-o>$")

map('i', '<A-w>', '<Esc><C-w>h')
map('i', '<A-s>', '<Esc><C-w>j')
map('i', '<A-a>', '<Esc><C-w>k')
map('i', '<A-d>', '<Esc><C-w>l')

