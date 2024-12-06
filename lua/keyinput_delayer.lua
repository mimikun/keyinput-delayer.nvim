local KeyinputDelayer = {}

local default_opts = {
    use_default_config = true,
    delay = 1000,
}

local enabled = true

local group = vim.api.nvim_create_augroup("keyinput_delayer", { clear = true })

local function keyinput_delayer(ms)
    if not enabled then
        return
    end

    if vim.fn.reg_executing() == "" and vim.v.event["typed"] == true then
        vim.uv.sleep(ms)
    end
end

function KeyinputDelayer.enable(ms)
    enabled = true
    keyinput_delayer(ms)
end

function KeyinputDelayer.disable()
    enabled = false
end

function KeyinputDelayer.toggle(ms)
    local delay = ms

    if enabled then
        KeyinputDelayer.disable()
    else
        KeyinputDelayer.enable(delay)
    end
end

function KeyinputDelayer.setup(opts)
    opts = vim.tbl_deep_extend(opts, default_opts, "keep")
    if opts.use_default_config then
        -- usercmd
        vim.api.nvim_create_user_command("EnableKeyinputDelayer", function()
            KeyinputDelayer.enable(opts.delay)
        end, {})
        vim.api.nvim_create_user_command("DisableKeyinputDelayer", function()
            KeyinputDelayer.disable()
        end, {})
        vim.api.nvim_create_user_command("ToggleKeyinputDelayer", function()
            KeyinputDelayer.toggle(opts.delay)
        end, {})

        -- autocmd
        vim.api.nvim_create_autocmd({ "KeyInputPre" }, {
            group = group,
            pattern = "*",
            callback = keyinput_delayer,
        })
    end
end

return KeyinputDelayer
