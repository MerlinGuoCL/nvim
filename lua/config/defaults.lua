-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.b.fileencoding = "utf-8"



-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 15
vim.o.sidescrolloff = 15
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"



-- Tab及空格设置
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.signcolumn = "yes"

-- 鼠标支持
vim.o.mouse = "a"



-- 配置剪切板
vim.opt.clipboard = "unnamedplus"

-- 命令自动补全
vim.o.wildmenu = true

-- 设置真彩色
vim.o.termguicolors = true


-- undo设置
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')


vim.o.exrc = true

-- 当使用:vsplit 打开另一个文件保证此窗口在右侧
vim.o.splitright = true




--Latex 设置
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'

vim.g.vimtex_view_general_options = '-r @line @pdf @tex'

-- This adds a callback hook that updates Skim after compilation
vim.g.vimtex_compiler_callback_hooks = {'UpdateSkim'}

-- Define the function to update Skim after compilation
local function UpdateSkim(status)
  if not status then return end

  local out = vim.b.vimtex.out()
  local tex = vim.fn.expand('%:p')
  local cmd = {vim.g.vimtex_view_general_viewer, '-r'}

  if not vim.fn.empty(vim.fn.system('pgrep Skim')) then
    table.insert(cmd, '-g')
  end

  if vim.fn.has('nvim') then
    vim.api.nvim_create_job(cmd + {vim.fn.line('.'), out, tex})
  elseif vim.fn.has('job') then
    vim.api.nvim_create_job(cmd + {vim.fn.line('.'), out, tex})
  else
    vim.fn.system(table.concat(cmd + {vim.fn.line('.'), vim.fn.shellescape(out), vim.fn.shellescape(tex)}, ' '))
  end
end











