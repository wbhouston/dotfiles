function GotoTodo()
  vim.cmd("vi todo.md")
end

function GotoJournal()
  local date = os.date( "%Y-%m-%d", os.time() - 5 * 60 * 60 )
  local filepath = 'journal/day/' .. date .. '.md'
  vim.cmd("vi " .. filepath)
end

function PKMGoto()
  local line = vim.fn.getline('.')
  local pos = vim.fn.getpos('.')
  local column = pos[3]
  local search_within_string = string.sub(line, 0, column)
  local full_string_search = false
  local init = 1
  local link = nil

  while(init and init <= column) do
    local internal_link_start, _ = string.find(search_within_string, '%[%[', init)

    if internal_link_start then
      local full_start, full_end = string.find(line, '%b[]', internal_link_start)

      if not full_string_search and full_start <= column and column <= full_end then
        -- Found a link under the cursor
        link = string.sub(line, full_start + 2, full_end - 2)
        break
      elseif full_string_search and full_start then
        -- We are not in a link, but this line has a link. Going there.
        link = string.sub(line, full_start + 2, full_end - 2)
        break
      else
        -- This link start did not have a link end.
        init = full_end + 1
      end
    else
      if full_string_search then
        -- We did not find a link anywhere.
        break
      else
        -- The cursor was not under a link, search the full string.
        search_within_string = line
        full_string_search = true
        init = 1
      end
    end
  end

  if link then
    print('link', link)
    local filepath = link .. '.md'
    local f = io.open(filepath,"r")
    if f ~= nil then
      io.close(f)
      vim.cmd("vi " .. filepath)
    end
  end
end

function PKMSettings()
  vim.o.linebreak = true
  vim.o.wrap = true
  vim.o.colorcolumn = '0'

  vim.cmd([[NERDTree]])
  vim.cmd([[wincmd l]])
  vim.cmd([[AerialOpen]])
  vim.cmd([[wincmd h]])
  vim.cmd([[vi index.md]])
end

nmap("<leader>pkm", ":lua PKMSettings()<cr>", "Open PKM index with NERDTree and Aerial")
nmap("gm", ":lua PKMGoto()<cr>", "Open PKM file under cursor")
nmap("<leader>pj", ":lua GotoJournal()<cr>", "Open Journal")
nmap("<leader>pt", ":lua GotoTodo()<cr>", "Open TODO")

vim.api.nvim_create_user_command('PKMSettings', 'lua PKMSettings()', {})
