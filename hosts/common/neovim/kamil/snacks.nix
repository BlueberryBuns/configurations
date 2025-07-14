{ ... }:

{
  programs.nvf.settings.vim.utility.snacks-nvim = {
    enable = true;
    setupOpts = {
      bigfile.enable = true;
      animate.enable = true;
      # bufdelete.enable = true;
      # dashboard.enable = true;
      explorer.enable = true;
      git.enable = true;
      gitbrowse.enable = true;
      # indent.enable = true;
      input.enable = true;
      util.enable = true;
      rename.enable = true;
    };
  };
}
