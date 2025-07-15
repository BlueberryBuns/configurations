{ ... }:

{
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
    
    nix = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    go = {
      enable = true;
      format = {
        enable = true;
        type = "gofumpt";
      };
      lsp.enable = true;
      treesitter.enable = true;
    };

    python = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    elixir = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    ts = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
