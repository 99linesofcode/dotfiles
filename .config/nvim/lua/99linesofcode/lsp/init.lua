local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'fidget'.setup()
require 'neodev'.setup()
require '99linesofcode.lsp.mason'
require '99linesofcode.lsp.handlers'.setup()
