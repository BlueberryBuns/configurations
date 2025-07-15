{ ... }:

{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "jk";
      mode = "i";
      action = "<ESC>";
      desc = "Exit insert mode with jk";
    }
    {
      key = "<leader>sv";
      mode = "n";
      action = "<C-w>v";
      desc = "Split window vertically";
    }
    {
      key = "<leader>sh";
      mode = "n";
      action = "<C-w>s";
      desc = "Split window horizontally";
    }
    {
      key = "<leader>se";
      mode = "n";
      action = "<C-w>=";
      desc = "Make splits equal size";
    }
    {
      key = "<leader>sx";
      mode = "n";
      action = "<cmd>close<CR>";
      desc = "Close current split";
    }
  ];
}
