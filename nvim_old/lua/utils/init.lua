function map(mode, shortcut, command, opts)
  local merged_opts = {}
  if opts then
    merged_opts = { noremap = true, silent = true, unpack(opts) }
  else
    merged_opts = { noremap = true, silent = true }
  end

  vim.api.nvim_set_keymap(mode, shortcut, command, merged_opts)
end

function nmap(shortcut, command, desc)
  map('n', shortcut, command, { desc = desc })
end

function imap(shortcut, command, desc)
  map('i', shortcut, command, { desc = desc })
end

