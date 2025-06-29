{ ... }:

{
  imports = [
    ./lsp.nix
    ./telescope.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };
}
