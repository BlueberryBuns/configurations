{ ... }:

{
  imports = [
    ./colorizer.nix
    ./lsp.nix
    ./telescope.nix
    ./keymaps.nix
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
    };
    
  };
}
