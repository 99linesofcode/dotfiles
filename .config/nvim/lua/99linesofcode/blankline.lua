local status_ok, blankline = pcall(require, 'indent-blankline.nvim')
if not status_ok then
  return
end

blankline.setup()
