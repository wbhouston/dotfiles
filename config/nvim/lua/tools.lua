local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local rerun_text = t'<c-c>!!\n\n'
local docs_server_buf = 'Docs Server'

local function send(job_id, command)
  vim.call('jobsend', job_id, command)
end

local function start_servers()
  vim.api.nvim_command('vsp')
  vim.api.nvim_command('terminal')
  barcoder_job = vim.b.terminal_job_id
  send(barcoder_job, 'cd ../val-barcoder\n')
  send(barcoder_job, 'foredev\n')
  vim.api.nvim_command('vsp')
  vim.api.nvim_command('terminal')
  docs_job = vim.b.terminal_job_id
  send(docs_job, 'foredev\n')
  vim.api.nvim_command('q')
  vim.api.nvim_command('q')
end

local function open_terminal()
  vim.api.nvim_command('terminal')
end

function _G.restart_server()
  docs_buf = vim.call('bufadd', docs_server_buf)
  docs_job = vim.call('getbufvar', docs_buf, 'terminal_job_id')

  if !docs_job then
    vim.api.nvim_buf_call(docs_buf, open_terminal())
  end

  docs_job = vim.call('getbufvar', docs_buf, 'terminal_job_id')

  if docs_job then
    send(docs_job, rerun_text)
    print('server restarted')
  else
    start_servers()
    print('servers started')
  end
end

nmap(t'<leader>rs', t':lua restart_server()<cr>')
-- nvim_open_term(buffer, opts)
-- nvim_chan_send(channel, bytes)
-- nvim_replace_termcodes()
-- nvim_set_current_buf(buffer)
-- let bufvars = getbufvar(buf, ''); echo
