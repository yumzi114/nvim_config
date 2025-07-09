require "nvchad.autocmds"


vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      vim.notify("📖 Opened file: " .. vim.fn.expand("%:t"))
    end,
  })

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
      vim.notify("💾 File saved: " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
    end,
  })
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.notify("🔧 LSP attached: " .. client.name)
  end,
})
-- vim.api.nvim_create_autocmd("DiagnosticChanged", {
--     callback = function()
--       local count = #vim.diagnostic.get(0)
--       if count > 0 then
--         vim.notify("⚠ " .. count .. " diagnostics in buffer")
--       end
--     end,
--   })

vim.api.nvim_create_autocmd("InsertEnter", {
callback = function()
    vim.notify("⌨️ Insert mode")
end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
callback = function()
    vim.notify("🔙 Normal mode")
end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:[vV\x16]", -- normal → visual로 진입할 때
    callback = function()
      vim.notify("🟪 Visual mode")
    end,
  })
  
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "[vV\x16]:n", -- visual → normal로 나올 때
    callback = function()
      vim.notify("🔙 Back to normal mode")
    end,
  })