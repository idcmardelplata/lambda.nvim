function SafeRequire(modname)
  local is_ok, mod = pcall(require, tostring(modname))
  if not is_ok then
    error("Error cargando la configuracion de " .. tostring(modname))
    return
  else
    return mod
  end
end

function Load_according_filetype(filetype, plugin_name, config)
  if vim.bo.filetype == filetype then
    require(tostring(plugin_name))(config)
  end
end
