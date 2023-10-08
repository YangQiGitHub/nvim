local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 高亮行
opt.cursorline = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止折行
opt.wrap = false

-- 启用鼠标
opt.mouse:append("a")

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 剪切板
opt.clipboard = "unnamed"

-- 新建窗口位置
opt.splitbelow = true
opt.splitright = true

-- 开启真色彩 
opt.termguicolors = true


vim.opt.list = true

-- 光标距离底部行数
opt.scrolloff = 5



-- copy 后高亮
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


