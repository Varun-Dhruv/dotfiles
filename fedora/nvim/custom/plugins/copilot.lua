local present,copilot = pcall(require,"nvim-copilot")
if not present then
  return
end
copilot.setup({
  -- key mapping
  mapping={
    ['<Ctrl-Tab']= copilot.mapping.complete(),
    ['<C-e>']=copilot.mapping.close(),
  },
})
