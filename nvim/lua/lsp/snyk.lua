vim.lsp.config["snyk"] = {
  cmd = { "snyk", "language-server" },
  filetypes = { "ruby" },
  init_options = {
    activateSnykCode = 'true',
    token = os.getenv("SNYK_TOKEN"),
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
    local checker = function(root_dir)
      if root_dir == "val-doc-storage" or root_dir == "val-barcoder" then
        return root_dir
      else
        return nil
      end
    end

    on_dir(checker(fname))
  end,
  root_markers = { ".git" },
}
vim.lsp.enable("snyk")
