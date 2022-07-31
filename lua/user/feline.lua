local is_ok, fe = pcall(require, "feline")
if not is_ok then
   error("Error al cargar feline")
   return
end

fe.setup()
