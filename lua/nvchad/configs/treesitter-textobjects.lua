local opts = {
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

      keymaps = {
        -- Replicating mini.ai's 'o', 'f', 'c' (Tree-sitter based)
        ["ao"] = "@block.outer", -- 'a'round 'o'bject (general block/statement)
        ["io"] = "@block.inner", -- 'i'nner 'o'bject (general block/statement)
        ["af"] = "@function.outer", -- 'a'round 'f'unction
        ["if"] = "@function.inner", -- 'i'nner 'f'unction
        ["ac"] = "@class.outer", -- 'a'round 'c'lass

        ["ae"] = "@identifier.outer", -- 'a'round 'e'lement (identifier/variable)
        ["ie"] = "@identifier.inner", -- 'i'nner 'e'lement

        ["ai"] = "@block.outer", -- 'a'round 'i'ndented block (syntax block)
        ["ii"] = "@block.inner", -- 'i'nner 'i'ndented block (syntax block)

        ["aB"] = "@block.outer", -- 'a'round 'B'lock (using Cap B)
        ["iB"] = "@block.inner", -- 'i'nner 'B'lock

        -- Replicating mini.ai's 'u', 'U' (function call)
        ["au"] = "@call.outer", -- 'a'round 'u'se (function call)
        ["iu"] = "@call.inner", -- 'i'nner 'u'se
      },

      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
        ["@block.outer"] = "V", -- linewise selection for blocks
        ["@loop.outer"] = "V",
        ["@conditional.outer"] = "V",
        ["@identifier.outer"] = "v", -- identifiers usually charwise
      },
      include_surrounding_whitespace = true,
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]b"] = "@block.outer",
      },
      goto_next_end = {
        ["[f"] = "@function.outer",
        ["[b"] = "@block.outer",
      },
      goto_previous_start = {
        ["[[f"] = "@function.outer",
        ["[[b"] = "@block.outer",
      },
      goto_previous_end = {
        ["[]f"] = "@function.outer",
        ["[]b"] = "@block.outer",
      },
    },
  },
}

return opts
