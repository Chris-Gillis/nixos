{ pkgs, lib }: {
  # Select a theme from the files available in ./themes
  theme = import ./themes/everforest.nix { inherit pkgs lib; };

  # File Tree
  neo-tree = import ./neo-tree.nix { inherit pkgs lib; };
    plenary = import ./plenary.nix { inherit pkgs lib; };
    nui = import ./nui.nix { inherit pkgs lib; };
    nvim-web-devicons = import ./nvim-web-devicons.nix { inherit pkgs lib; };

  # AI Suggestions
  # codeium = import ./codeium.nix { inherit pkgs lib; };
  copilot = import ./copilot.nix { inherit pkgs lib; };

  # Syntax Highlighting / Language Support
  treesitter = import ./nvim-treesitter.nix { inherit pkgs lib; };
  lsp = import ./lsp.nix { inherit pkgs lib; };

  # Utilities
  comment = import ./comment.nix { inherit pkgs lib; };
  telescope = import ./telescope.nix { inherit pkgs lib; };
}
