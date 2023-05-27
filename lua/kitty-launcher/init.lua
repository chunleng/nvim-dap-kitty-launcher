local M = {}

function M.setup()
    local script_path = vim.fn.resolve(debug.getinfo(1).source ..
                                           '/../../../bin/kitty_launcher.sh'):sub(
                            2)
    local pid = vim.api.nvim_call_function('getpid', {})
    local cwd = vim.api.nvim_call_function('getcwd', {})
    require('dap').defaults.fallback.external_terminal = {
        command = script_path,
        args = {
            pid, -- pid for providng unique remote window ID per nvim
            cwd -- To ensure launching the command at the correct directory
        }
    }
end

return M
