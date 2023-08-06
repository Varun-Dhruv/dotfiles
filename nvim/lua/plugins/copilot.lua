
local copilot_status, copilot = pcall(require, 'nvim-copilot')
if not copilot_status then
  return
end

copilot.setup({
  -- Key mapping
  mapping = {
    ['<Ctrl-Tab'] = copilot.mapping.complete(),
    ['<C-e>'] = copilot.mapping.close(),
    ['<CR>'] = copilot.mapping.confirm {
      behavior = copilot.ConfirmBehavior.Replace,
      select = true,
    },
  },
}
)