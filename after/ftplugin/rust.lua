config = function()
    local ok, mason_registry = pcall(require, "mason-registry")
    if not ok then
      vim.notify("mason-registry not found")
      return
    end
  
    local codelldb = mason_registry.get_package("codelldb")
    if not codelldb or not codelldb.get_install_path then
      vim.notify("codelldb package not found or broken")
      return
    end
  
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  
    local cfg = require("rustaceanvim.config")
    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end