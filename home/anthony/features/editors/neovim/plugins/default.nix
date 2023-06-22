{ pkgs, lib }:
let
  themes = import ./themes { inherit pkgs lib; };
in{
  # Select a theme from the files available in ./themes
  theme = themes.everforest;

  # Dependencies
  plenary = import ./plenary.nix { inherit pkgs lib; };
  nui = import ./nui.nix { inherit pkgs lib; };

  # File Tree
  neo-tree = import ./neo-tree.nix { inherit pkgs lib; };
  nvim-web-devicons = import ./nvim-web-devicons.nix { inherit pkgs lib; };

  # AI Suggestions
  # codeium = import ./codeium.nix { inherit pkgs lib; };
  copilot = import ./copilot.nix { inherit pkgs lib; };

  # Syntax Highlighting / Language Support
  treesitter = import ./nvim-treesitter.nix { inherit pkgs lib; };
  lsp = import ./lsp.nix { inherit pkgs lib; };

  # Code Completion
  nvim-cmp = import ./nvim-cmp.nix { inherit pkgs lib; };
  lspkind-nvim = import ./lspkind-nvim.nix { inherit pkgs lib; };
  cmp-nvim-lsp = import ./cmp-nvim-lsp.nix { inherit pkgs lib; };
  cmp-buffer = import ./cmp-buffer.nix { inherit pkgs lib; };
  cmp-path = import ./cmp-path.nix { inherit pkgs lib; };

  # Status Line + Tab/Buffer Line
  lualine = import ./lualine.nix { inherit pkgs lib; };
  barbar = import ./barbar.nix { inherit pkgs lib; };

  # Utilities
  comment = import ./comment.nix { inherit pkgs lib; };
  indent-blankline = import ./indent-blankline.nix { inherit pkgs lib; };
  nvim-autopairs = import ./nvim-autopairs.nix { inherit pkgs lib; };
  telescope = import ./telescope.nix { inherit pkgs lib; };
}
