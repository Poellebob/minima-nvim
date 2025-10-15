local M = {}

M.dependencies = {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
  },
  "folke/snacks.nvim",
  {
    "lervag/vimtex",
    lazy = false,
  },
}

function M.setup(opts)
  opts = opts or {}
  
  -- Set up make keymap
  vim.keymap.set("n", "-m", "<cmd>!make<cr>", {desc = "Run Make"})
  
  -- Configure lsp_signature if not disabled
  if opts.lsp_signature ~= false then
    require("lsp_signature").setup(opts.lsp_signature or {})
  end
  
  -- Configure snacks dashboard
  if opts.snacks_dashboard ~= false then
    local snacks_opts = opts.snacks_opts or {
      dashboard = {
        preset = {
          header = table.concat({
            "███    ███ ██ ███    ██ ██ ███    ███  █████  ",
            "████  ████ ██ ████   ██ ██ ████  ████ ██   ██ ",
            "██ ████ ██ ██ ██ ██  ██ ██ ██ ████ ██ ███████ ",
            "██  ██  ██ ██ ██  ██ ██ ██ ██  ██  ██ ██   ██ ",
            "██      ██ ██ ██   ████ ██ ██      ██ ██   ██ ",
          }, "\n")
        },
      },
    }
    require("snacks").setup(snacks_opts)
  end
  
  -- Configure VimTeX
  vim.g.vimtex_compiler_method = opts.vimtex_compiler_method or "latexmk"
  vim.g.vimtex_view_method = opts.vimtex_view_method or "zathura"
  vim.g.vimtex_quickfix_mode = opts.vimtex_quickfix_mode or 0
  vim.g.vimtex_view_automatic = opts.vimtex_view_automatic or 1
  
  vim.g.vimtex_compiler_latexmk = opts.vimtex_compiler_latexmk or {
    continuous = 1,
    callback = 1,
    build_dir = '',
    options = {
      '-pdf',
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
    },
  }
  
  -- Set up VimTeX keymaps
  vim.keymap.set("n", "-t", "", { desc = "+VimTeX" })
  vim.keymap.set("n", "-tl", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX (VimTeX)" })
  vim.keymap.set("n", "-tc", "<cmd>VimtexClean<cr>", { desc = "Clean LaTeX build (VimTeX)" })
  vim.keymap.set("n", "-tv", "<cmd>VimtexView<cr>", { desc = "View PDF (VimTeX)" })
  vim.keymap.set("n", "-tw", "<cmd>VimtexLog<cr>", { desc = "Open LaTeX log (VimTeX)" })
  vim.keymap.set("n", "-ts", "<cmd>VimtexStop<cr>", { desc = "Stop compilation (VimTeX)" })
end

return M
