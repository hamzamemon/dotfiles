local status_ok, targets = pcall(require, 'targets')
if not status_ok then
  return
end

vim.g.targets_aiAI = 'aiAI'
-- vim.g.targets_mapped_aiAI = vim.targets_aiAI
vim.g.targets_nl = 'nl'
vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb al rB Al bb aa bB Aa BB AA'
vim.g.targets_jumpRanges = 'bb bB BB aa Aa AA'
vim.g.targets_gracious = 0
