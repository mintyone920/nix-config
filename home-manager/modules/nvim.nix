{
  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    colorschemes.nord = {
      enable = true;
    };
    options = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      termguicolors = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = false;
      wrap = false;
      undofile = true;
      foldmethod = "marker";
    };
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
        };
        keymaps = {
          diagnostic = {
          };
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            "<leader>r" = "format";
          };
        };
      };

      cmp = {
        enable = true;
        settings = {
          snippet = {
            expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
          mapping = {
            "<C-f>" = "cmp.mapping.scroll_docs(-4)";
            "<C-h>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({select = true})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "path";}
            {name = "buffer";}
          ];
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lua.enable = true;

      lualine = {
        enable = true;
      };
    };
    keymaps = [
      {
        action = "<cmd>Ex<cr>";
        key = "<leader>e";
        mode = "n";
      }
      {
        action = "<cmd>Lexplore<cr>";
        key = "<leader>E";
        mode = "n";
      }
      {
        action = "<cmd>w<cr>";
        key = "<leader>w";
        mode = "n";
      }
      {
        action = "<cmd>q<cr>";
        key = "<leader>q";
        mode = "n";
      }
    ];
  };
}
