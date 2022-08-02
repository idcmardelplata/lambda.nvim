local is_ok, litee = pcall(require, "litee.lib")
if not is_ok then
  error("Error al cargar litee")
  return
end

litee.setup {
  tree = {
    icon_set = "codicons"
  },
  panel = {
    orientation = "left",
    panel_size  = 30
  }
}
