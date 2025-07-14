{ pkgs, ... }:

{
  programs.nvf.settings.vim.telescope = {
    enable = true;

    setupOpts.defaults = {
      color_devicons = true;
      initial_mode = "normal";
    };
    
    extensions = [
      {
        name = "fzf";
        packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
        setup = {fzf = {fuzzy = true;};};
      }
    ];
  };
}
