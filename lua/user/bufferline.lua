local is_ok, buf = pcall(require, "bufferline")
if not is_ok then
  error("Error al cargar bufferline")
  return
end

buf.setup {
        options = {
            mode = "buffers", -- can also be set to "tabs" to see tabpages
            themable = false,-- whether or not the highlights for this plugin can be overriden.
            numbers = "both",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            buffer_close_icon= "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will NOT be fixed.
            name_formatter = function(buffer)  -- buf contains a "name", "path" and "bufnr"
              -- remove extension from markdown files for example
              if buffer.name:match('%.md') then
                return vim.fn.fnamemodify(buffer.name, ':t:r')
              end
            end,
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is deduplicated
            tab_size = 18,
            diagnostics =  "nvim_lsp",
            diagnostics_indicator = function(count, _)
              return "("..count..")"
            end,
            show_buffer_icons = true ,
            show_buffer_close_icons = true,
            show_buffer_default_icon = true,
            show_close_icon =  false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { "|", "|" }
            separator_style = "slant" ,
            -- separator_style = "slant" | "padded_slant" | "thick" | "thin" | { "any", "any" },
            enforce_regular_tabs = false ,
            always_show_bufferline = true,
            offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
            sort_by =  "extension" ,
            -- sort_by = "id" | "extension" | "relative_directory" | "directory" | "tabs" | function(buffer_a, buffer_b)
            -- add custom logic
                -- return buffer_a.modified > buffer_b.modified
            -- end
        }
}
