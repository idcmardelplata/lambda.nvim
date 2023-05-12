local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- Crear snippets basicos
-- ls.add_snippets('lua', {
--   s('var',{
--     t('local '),
--     i(1, 'name'),
--     t(' = '),
--     i(2, "'value'"),
--   } )
-- })


-- crear un snippet con fmt
-- ls.add_snippets('lua', {
--   s('var', fmt('local {} = {}', {
--     i(1, 'name'),
--     i(2, 'value'),
--   }))
-- })

-- Agregar un snippet cambiable
-- ls.add_snippets('lua', {
  -- s('s', c(1, {
  --   t('1st'),
  --   t('2nd'),
  --   t('3rd'),
  -- }))
--   s('c', c(1, {
--     fmt('local {} = {}', {
--       i(1, 'name'),
--       i(2, "'value'")
--     }),
--     fmt('{} = {}', {
--       i(1, 'name'),
--       i(2, "'value'")
--     }),
--   }))
-- })

-- Function node, permite ejecutar funciones cuando se llama a los snippets
-- ls.add_snippets('lua', {
--   s('ii', f(function ()
--    return os.date('%Y-%m-%d')
--   end))
-- })


-- ls.add_snippets('lua', {
--   s('ii', fmt('local {} = require("{}")', {
--     f(function (values)
--       local value = values[1][1]
--       local path = vim.split(value, '%.')
--       return path[#path]
--     end, { 1 }),
--     i(1)
--
--   }))
-- })

ls.add_snippets('lua', {
  s('ii', fmt('{} {} {}', {
    i(2, {'line 1', 'line 2'}),
    i(1, '111'),
    f(function (values)
      print(values)
      return 'test'

    end, { 1, 2 })
  }))
})

