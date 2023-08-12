return {
  {
    "phaazon/hop.nvim",
    config = function()
      local hop = require("hop")
      -- local dirs = require("hop/hint")
      local function map(key, cmd, desc)
        local prefix = "<leader>j"
        vim.keymap.set("", prefix .. key, cmd, { remap = true, desc = desc })
      end
      map("c", "<cmd>HopChar1<cr>", "to char1")
      map("C", "<cmd>HopChar2<cr>", "to char2")
      map("l", "<cmd>HopVertical<cr>", "to line")
      map("w", "<cmd>HopWord<cr>", "to word")
      map("/", "<cmd>HopPattern<cr>", "pattern")
      hop.setup()
    end,
    -- keys = {
    -- 	{ "<leader>jw", "<cmd>HopWord<cr>", desc = "jump to word" },
    -- },
  },
  -- telescope
  { "nvim-telescope/telescope.nvim" },

  -- telescope fzf
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      --[[ config = function()
        require('telescope').load_extension('fzf')
      end,
      ]]
      --
    },
  },
}
