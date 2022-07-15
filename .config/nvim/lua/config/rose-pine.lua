require("rose-pine").setup({
  -- Set variant
  -- Defaults to 'dawn' if vim background is light
  -- @usage 'base' | 'moon' | 'dawn' | 'rose-pine[-moon][-dawn]'
  dark_variant = "moon",

  -- Disable italics
  disable_italics = false,

  -- Use terminal background
  disable_background = false,

  -- Use bold vertical split line
  bold_vert_split = true
})
