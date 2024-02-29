local M = {}

M.opts = {
  prompts = {
    -- Code related prompts
    Explain = "Please explain how the following code works.",
    Review = "Please review the following code and provide suggestions for improvement.",
    Tests = "Please explain how the selected code works, then generate unit tests for it.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    FixCode = "Please fix the following code to make it work as intended.",
    FixError = "Please explain the error in the following text and provide a solution.",
    BetterNamings = "Please provide better names for the following variables and functions.",
    Documentation = "Please provide documentation for the following code.",
    -- Text related prompts
    Summarize = "Please summarize the following text.",
    Spelling = "Please correct any grammar and spelling errors in the following text.",
    Wording = "Please improve the grammar and wording of the following text.",
    Concise = "Please rewrite the following text to make it more concise.",
  },
  auto_follow_cursor = false,
  mappings = {
    close = "<Esc>",
    reset = "<C-r>",
    complete = "<Tab>",
    submit_prompt = "<CR>",
    accept_diff = "<C-a>",
    show_diff = "<C-s>",
  }
}

M.config = function(_, opts)
  local chat = require("CopilotChat")
  local select = require("CopilotChat.select")
  opts.selection = select.unnamed

  chat.setup(opts)

  vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
    chat.ask(args.args, { selection = select.visual })
  end, { nargs = "*", range = true })

  vim.api.nvim_create_user_command("CopilotChatInline", function(args)
    chat.ask(args.args, {
      selection = select.visual,
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    })
  end, { nargs = "*", range = true})

  vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
    chat.ask(args.args, { selection = select.buffer })
  end, { nargs = "*", range = true})
end

return M
