local is_ok, ntree = pcall(require, "nvim-tree")
if not is_ok then
  error("Error al cargar nvim-tree")
  return
end

ntree.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

