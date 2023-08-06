local leetcode_status, lc = pcall(require, 'ianding/leetcode.vim')
if not leetcode_status then
  return
end

-- lc.setup({
--     g:leetcode_browser('firefox')
-- })