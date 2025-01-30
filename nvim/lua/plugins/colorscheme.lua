return {
  "rebelot/kanagawa.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("kanagawa").setup({
      compile = false, -- Set to true if you want to compile the colorscheme for performance
      transparent = true, -- Enable transparency
      terminal_colors = true, -- Set terminal colors
      dimInactive = false, -- Don't dim inactive windows
      colors = {
        theme = {
          all = {
            ui = { bg_gutter = "none" } -- Remove gutter background
          }
        }
      },
      overrides = function(colors)
        return {
          Normal = { bg = "none" }, -- Remove background
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          SignColumn = { bg = "none" },
          LineNr = { bg = "none" },
        }
      end
    })

    -- Apply colorscheme
    vim.cmd("colorscheme kanagawa")
  end
}
