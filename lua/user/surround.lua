local surround = SafeRequire("nvim-surround")

surround.setup {
    highlight_motion = { -- Disables highlights
        duration = false,
    },
}
