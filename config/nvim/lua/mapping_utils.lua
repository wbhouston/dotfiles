function map(mode, shortcut, command, opts)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function write_mappings_to_file()
  vim.cmd([[
    :redir! > ~/Dotfiles/nvim_mappings.txt
    :silent verbose map
    :redir END
  ]])
end
