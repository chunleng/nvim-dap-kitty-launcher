local M = {}

function M.setup()
    local script_path = vim.fn.resolve(debug.getinfo(1).source ..
                                           '/../../../bin/kitty_launcher.sh'):sub(
                            2)
    require('dap').defaults.fallback.external_terminal = {command = script_path}
end

return M
