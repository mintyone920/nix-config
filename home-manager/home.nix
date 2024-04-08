{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./modules/nvim.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;      
      permittedInsecurePackages = [
        "nix-2.16.2"
      ];
    };
  };

  home = {
    username = "lukas";
    homeDirectory = "/home/lukas";

    sessionVariables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };


  home.packages = with pkgs; [ 
    steam
    kitty
    foot
    firefox
    nerdfonts
    rofi-wayland
  ];


  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Lukas Taroza";
    userEmail = "mintyone920@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
