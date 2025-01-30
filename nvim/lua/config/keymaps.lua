local M = {}

vim.g.mapleader = " "
local o = vim.opt
--editor options--
o.relativenumber = true
o.number = true
o.autoindent = true
o.cursorline = true --highlight screenline of cursor when starting a new line --
o.shiftwidth = 2
o.tabstop = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.swapfile = false
o.scrolloff = 8
o.signcolumn = "yes"

-- no idea what this command does, but it's there so not removing
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])


-- Map the function to F7 key in normal mode
vim.api.nvim_set_keymap("n", "<F7>", ":lua CommentToggle()<CR>", { noremap = true, silent = true })

--NeoTree Toggles--
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":Neotree toggle<CR>", {
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>y", "some_command", { noremap = true })
vim.keymap.set("v", "<leader>l", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-0>", ":BufferLast<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":BufferPick<CR>", { noremap = true })

vim.keymap.set("n", "<C-f>", function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true })


--General--
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--
-- Automatically save files when leaving insert mode or switching buffers
vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = "autosave",
	command = "silent! wall",
})



local function CommentToggle()
  -- Get the first and last line of the visual selection
  local start_line = vim.fn.line("v") -- Start of visual selection
  local end_line = vim.fn.line(".") -- End of visual selection
  
  -- Ensure start_line is always less than end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Loop through all the lines in the selection
  for line_num = start_line, end_line do
    local line = vim.fn.getline(line_num)
    local is_commented = line:match("^%s*//") -- Check if the line is already commented

    if is_commented then
      -- Uncomment the line
      line = line:gsub("^%s*//%s?", "")
    else
      -- Comment the line
      line = "// " .. line
    end

    vim.fn.setline(line_num, line) -- Set the modified line back
  end
end

-- Map the function to <Leader>/ key in normal mode
vim.keymap.set("n", "<Leader>/", CommentToggle, { noremap = true, silent = true })
-- Map the function to <Leader>/ key in visual mode (no need to use :lua)
vim.keymap.set("v", "<Leader>/", function()
  CommentToggle()
end, { noremap = true, silent = true })


--buffer shortcuts--
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { remap = true, silent = true })
vim.opt.guicursor=""
vim.opt.statusline = "top"
