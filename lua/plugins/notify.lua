local status, notify = pcall(require, "notify")
if not status then
  vim.notify("没有找到 notify")
  return
end

vim.notify = notify
vim.notify.setup({
  background_colour = "#000000",
})
require("telescope").load_extension("notify")
