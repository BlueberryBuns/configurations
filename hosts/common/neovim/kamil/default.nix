{ ... }:

{
  imports = [
    ./colorizer.nix
    ./lsp.nix
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
    ./keymaps.nix
    ./snacks.nix
    ./web-devicons.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };

      vim.options = {
        tabstop = 4;
        shiftwidth = 4;
        wrap = false;
      };

      vim.ui.borders.enable = true;
      vim.ui.borders.plugins.which-key.enable = true;
    };
  };
}
