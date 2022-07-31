local is_ok, fe = pcall(require, "feline")
if not is_ok then
   error("Error al cargar feline")
   return
end

fe.setup()

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})


table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Prepara la insercion de componentes
table.insert(components.active[1], {
  provider = 'git_branch'
})

table.insert(components.active[1], {
  provider = 'git_diff_addedd'

})

table.insert(components.active[2], { provider = 'diagnostic_errors' })

table.insert(components.active[3], { provider = 'diagnostic_warnings' })

table.insert(components.inactive[1], {  provider = 'diagnostic_hints' })

table.insert(components.inactive[2], {  provider = 'diagnostic_info' })
