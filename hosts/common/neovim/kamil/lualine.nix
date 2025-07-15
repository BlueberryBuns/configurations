{ ... }:

{
  programs.nvf.settings.vim.statusline.lualine = {
    enable = true;
    refresh = {
      statusline = 300;
      tabline = 300;
      winbar = 300;
    };
  };
}
