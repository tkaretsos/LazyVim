return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Do not display time in lualine
    opts.sections.lualine_z = {}
  end,
}
