local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local barcoder_server_buf_name = 'Barcoder Server'
local buf_job_var = 'terminal_job_id'
local docs_server_buf_name = 'Docs Server'
local general_terminal = 'General Terminal'
local rails_console = 'Rails Console'
local spec_terminal = 'Specs'
local rerun_text = t'<c-c>!!\n\n'
local start_barcoder = t'cd ~/Code/val-barcoder\nforedev\n'
local start_docs = t'cd ~/Code/val-doc-storage\nforedev\n'
local start_rc = t'rc\n'
local run_specs_string = t'rsp spec\n'

local function send(job_id, command)
  vim.call('jobsend', job_id, command)
end

local function open_terminal()
  vim.call('termopen', '/bin/zsh')
end

local function terminal_id_from_buf_name(buf_name)
  local buf, buf_exists, job
  buf_exists = vim.call('bufexists', buf_name)

  if buf_exists ~= 0 then
    buf = vim.call('bufadd', buf_name)
  else
    buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_call(buf, open_terminal)
    vim.api.nvim_buf_set_name(buf, buf_name)
  end

  return vim.call('getbufvar', buf, buf_job_var)
end

local function start_server_if_missing(buf_name, send_text)
  local buf_exists = vim.call('bufexists', buf_name)

  if buf_exists == 0 then
    term_id = terminal_id_from_buf_name(buf_name)
    send(term_id, send_text)
    return true
  end

  return false
end

function _G.restart_server()
  start_server_if_missing(barcoder_server_buf_name, start_barcoder)
  if start_server_if_missing(docs_server_buf_name, start_docs) == false then
    send(terminal_id_from_buf_name(docs_server_buf_name), rerun_text)
    print('restarted server')
  else
    print('started server')
  end
end

function _G.rerun_specs()
  send(terminal_id_from_buf_name(spec_terminal), run_specs_string)
  print('started_specs')
end

local function goto_server(buf_name, send_text)
  start_server_if_missing(buf_name, send_text)

  buf = vim.call('bufadd', buf_name)

  vim.api.nvim_win_set_buf(0, buf)
end

function _G.goto_rc()
  goto_server(rails_console, start_rc)
end

function _G.goto_general()
  goto_server(general_terminal, '')
end

function _G.goto_specs()
  goto_server(spec_terminal, '')
end

function _G.initial_setup()
  vim.cmd('vsp')
  vim.cmd('vsp')
  restart_server()
  goto_rc()
  goto_general()
end

nmap(t'<leader>rs', t':lua restart_server()<cr>')
nmap(t'<leader>rc', t':lua goto_rc()<cr>')
nmap(t'<leader>gg', t':lua goto_general()<cr>')
nmap(t'<leader>gs', t':lua goto_specs()<cr>')
nmap(t'<leader>start', t':lua initial_setup()<cr>')
nmap(t'<leader>specs', t':lua rerun_specs()<cr>')
-- nvim_open_term(buffer, opts)
-- nvim_chan_send(channel, bytes)
-- nvim_replace_termcodes()
-- nvim_set_current_buf(buffer)
-- let bufvars = getbufvar(buf, ''); echo
