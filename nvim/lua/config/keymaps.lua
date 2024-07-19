-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "




-- 变量定义
local opt = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap





map("i", "jk", "<Esc>", opt)
map("v", "jk", "<Esc>", opt)
map("t", " ", ":", opt)
map("n", " ", ":", opt)




-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)


-- magic search
--map("n", "/", "/\\v", { noremap = true, silent = false })
--map("v", "/", "/\\v", { noremap = true, silent = false })


-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
map("n", "<C-h>", "<ESC>I", opt)
map("n", "<C-l>", "<ESC>A", opt)
map("v", "<C-h>", "<ESC>I", opt)
map("v", "<C-l>", "<ESC>A", opt)


-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)















