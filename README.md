# Install

## Lazy.nvim

```lua
return {
  {
    "poellebob/minima-nvim",
    dependencies = function()
      return require("minima").dependencies
    end,
    lazy = false,
    config = function()
      require("minima").setup({
        -- Optional: override defaults here
        -- vimtex_view_method = "zathura",
        -- lsp_signature = false,  -- disable lsp_signature
        -- snacks_dashboard = false,  -- disable snacks dashboard
      })
    end,
  },
}
```
