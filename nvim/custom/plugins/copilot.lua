local present,copilot = pcall(require,"nvim-copilot")
if not copilot_status then
  return
end
copilot.setup({
  -- key mapping
  mapping={
    ['<Ctrl-Tab']= copilot.mapping.complete(),
    ['<C-e>']=copilot.mapping.close(),
  },
})
