function SafeRequire(modname)
  local is_ok, mod = pcall(require, tostring(modname))
  if not is_ok then
    error("Error cargando la configuracion de " .. tostring(modname))
    return
  else
    return mod
  end
end
