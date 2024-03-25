local status, flutterTools = pcall(require, "flutter-tools")

if not status then
  vim.notify("没有找到 flutter-tools")
  return
end

flutterTools.setup({
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
  },
})

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "flutter")
