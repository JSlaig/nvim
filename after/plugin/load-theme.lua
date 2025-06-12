function colorscheme_exists(color)
  local colors = vim.fn.getcompletion(color, 'color')
  for _, existing_color in ipairs(colors) do
    if existing_color == color then
      return true
    end
  end
  return false
end

function remove_bg(color)
  -- Hardcoded fallback color
  local hard_color = "slate"

  color = color or hard_color

  -- Check if the colorscheme exists
  if not colorscheme_exists(color) then
    -- require("notify")("Colorscheme '" .. color .. "' not found or installed. Falling back to '" .. hard_color .. "'", "warn")
    color = hard_color
  end

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  -- require("notify")("Colorscheme loaded: " .. color, "info") 
end

-- ############################################################################
---- SET COLORSCHEME
-- ############################################################################

-- local scheme = "catppuccin"
local scheme = "catppuccin"

-- ############################################################################
--
-- ############################################################################

remove_bg(scheme)

