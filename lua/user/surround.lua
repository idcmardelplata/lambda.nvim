local is_ok, surround = pcall(require, "nvim-surround")
if not is_ok then
  error("Error al cargar nvim-surround")
  return
end

surround.setup {
    highlight_motion = { -- Disables highlights
        duration = false,
    },
}
