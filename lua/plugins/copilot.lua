return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      if not opts.mapping then opts.mapping = {} end

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        -- 1. If Copilot has a visible suggestion, accept it
        local copilot_keys = vim.fn["copilot#Accept"]("")
        if copilot_keys ~= "" then
          vim.api.nvim_feedkeys(copilot_keys, "i", true)
        -- 2. If a snippet is expandable/jumpable, do that
        elseif vim.snippet and vim.snippet.active { direction = 1 } then
          vim.snippet.jump(1)
        -- 3. If cmp menu is visible, select next item
        elseif cmp.visible() then
          cmp.select_next_item()
        -- 4. Otherwise, insert a normal Tab
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.snippet and vim.snippet.active { direction = -1 } then
          vim.snippet.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" })

      return opts
    end,
  },
}
