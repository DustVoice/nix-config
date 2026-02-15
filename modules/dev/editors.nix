let
  helix.homeManager.programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_macchiato";

      editor = {
        bufferline = "multiple";
        color-modes = true;
        end-of-line-diagnostics = "hint";
        line-number = "relative";

        cursor-shape.insert = "bar";
        cursor-shape.normal = "block";
        cursor-shape.select = "underline";

        file-picker.hidden = false;
        indent-guides.render = true;
        inline-diagnostics.cursor-line = "warning";

        lsp.display-inlay-hints = true;
        lsp.display-messages = true;

        soft-wrap.enable = true;

        whitespace.render.tab = "all";
        whitespace.render.nbsp = "all";
      };

      keys.normal = {
        g.left = "goto_line_start";
        g.right = "goto_line_end";
        g.up = "goto_file_start";
        g.down = "goto_last_line";
        space.l.g = [ ":new" ":insert-output lazygit" ":buffer-close!" ":redraw" ];
        space.l.j = [ ":new" ":insert-output lazygit" ":buffer-close!" ":redraw" ];
      };
    };
  };

  neovim.nixos.programs.neovim.enable = true;
in
{
  dev.editors.includes = [
    helix
    neovim
  ];
}
