{ pkgs, lib, config, ... }:
{
  options = {
    cli.zellij.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.cli.zellij.enable {
    home.file = {
      ".config/zellij/config.kdl".text = /*kdl*/''
        keybinds clear-defaults=true {
            normal {
                // uncomment this and adjust key if using copy_on_select=false
                // bind "Alt c" { Copy; }
            }
            locked {
                bind "Ctrl g" { SwitchToMode "Normal"; }
            }
            resize {
                bind "h" "Left" { Resize "Increase Left"; }
                bind "j" "Down" { Resize "Increase Down"; }
                bind "k" "Up" { Resize "Increase Up"; }
                bind "l" "Right" { Resize "Increase Right"; }
                bind "H" { Resize "Decrease Left"; }
                bind "J" { Resize "Decrease Down"; }
                bind "K" { Resize "Decrease Up"; }
                bind "L" { Resize "Decrease Right"; }
                bind "=" "+" { Resize "Increase"; }
                bind "-" { Resize "Decrease"; }
            }
            pane {
                bind "h" "Left" { MoveFocus "Left"; }
                bind "l" "Right" { MoveFocus "Right"; }
                bind "j" "Down" { MoveFocus "Down"; }
                bind "k" "Up" { MoveFocus "Up"; }
                bind "p" { SwitchFocus; }
                bind "n" { NewPane; SwitchToMode "Normal"; }
                bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
                bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
                bind "x" { CloseFocus; SwitchToMode "Normal"; }
                bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
                bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
                bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
                bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
                bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
            }
            move {
                bind "n" "Tab" { MovePane; }
                bind "h" "Left" { MovePane "Left"; }
                bind "j" "Down" { MovePane "Down"; }
                bind "k" "Up" { MovePane "Up"; }
                bind "l" "Right" { MovePane "Right"; }
            }
            tab {
                bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
                bind "h" "Left" "Up" "k" { GoToPreviousTab; }
                bind "l" "Right" "Down" "j" { GoToNextTab; }
                bind "n" { NewTab; SwitchToMode "Normal"; }
                bind "x" { CloseTab; SwitchToMode "Normal"; }
                bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
                bind "1" { GoToTab 1; SwitchToMode "Normal"; }
                bind "2" { GoToTab 2; SwitchToMode "Normal"; }
                bind "3" { GoToTab 3; SwitchToMode "Normal"; }
                bind "4" { GoToTab 4; SwitchToMode "Normal"; }
                bind "5" { GoToTab 5; SwitchToMode "Normal"; }
                bind "6" { GoToTab 6; SwitchToMode "Normal"; }
                bind "7" { GoToTab 7; SwitchToMode "Normal"; }
                bind "8" { GoToTab 8; SwitchToMode "Normal"; }
                bind "9" { GoToTab 9; SwitchToMode "Normal"; }
                bind "Tab" { ToggleTab; }
            }
            scroll {
                bind "Ctrl s" { SwitchToMode "Normal"; }
                bind "e" { EditScrollback; SwitchToMode "Normal"; }
                bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
                bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
                bind "j" "Down" { ScrollDown; }
                bind "k" "Up" { ScrollUp; }
                bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
                bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
                bind "d" { HalfPageScrollDown; }
                bind "u" { HalfPageScrollUp; }
                // uncomment this and adjust key if using copy_on_select=false
                // bind "Alt c" { Copy; }
                bind "n" { Search "down"; }
                bind "p" { Search "up"; }
                bind "c" { SearchToggleOption "CaseSensitivity"; }
                bind "w" { SearchToggleOption "Wrap"; }
                bind "o" { SearchToggleOption "WholeWord"; }
            }
            search {
                bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
                bind "j" "Down" { ScrollDown; }
                bind "k" "Up" { ScrollUp; }
                bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
                bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
                bind "d" { HalfPageScrollDown; }
                bind "u" { HalfPageScrollUp; }
                bind "n" { Search "down"; }
                bind "p" { Search "up"; }
                bind "c" { SearchToggleOption "CaseSensitivity"; }
                bind "w" { SearchToggleOption "Wrap"; }
                bind "o" { SearchToggleOption "WholeWord"; }
            }
            entersearch {
                bind "Enter" { SwitchToMode "Search"; }
            }
            renametab {
                bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
            }
            renamepane {
                bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
            }
            session {
                bind "d" { Detach; }
            }
            tmux {
                //modes
                bind "Ctrl s" { SwitchToMode "Scroll"; }
                bind "Ctrl p" { SwitchToMode "Pane"; }
                bind "Ctrl t" { SwitchToMode "Tab"; }
                bind "Ctrl n" { SwitchToMode "Resize"; }
                bind "Ctrl h" { SwitchToMode "Move"; }
                bind "Ctrl g" { SwitchToMode "Locked"; }
                //panes
                bind "h" "Left" { MoveFocus "Left"; }
                bind "l" "Right" { MoveFocus "Right"; }
                bind "j" "Down" { MoveFocus "Down"; }
                bind "k" "Up" { MoveFocus "Up"; }
                bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
                bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
                bind "n" { NewPane; SwitchToMode "Normal"; }
                bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
                bind "x" { CloseFocus; SwitchToMode "Normal"; }

                // tabs
                bind "H" { GoToPreviousTab; }
                bind "L" { GoToNextTab; }
                bind "N" { NewTab; SwitchToMode "Normal"; }
                bind "X" { CloseTab; SwitchToMode "Normal"; }
                bind "1" { GoToTab 1; SwitchToMode "Normal"; }
                bind "2" { GoToTab 2; SwitchToMode "Normal"; }
                bind "3" { GoToTab 3; SwitchToMode "Normal"; }
                bind "4" { GoToTab 4; SwitchToMode "Normal"; }
                bind "5" { GoToTab 5; SwitchToMode "Normal"; }
            }
            shared_except "locked" {
            }
            shared_except "normal" "locked" {
                bind "Enter" "Esc" { SwitchToMode "Normal"; }
            }
            shared_except "tmux" "locked" {
                bind "Ctrl s" { SwitchToMode "Tmux"; }
            }
        }

        plugins {
            tab-bar { path "tab-bar"; }
            status-bar { path "status-bar"; }
            strider { path "strider"; }
            compact-bar { path "compact-bar"; }
        }

        default_shell "fish"

        // Toggle between having pane frames around the panes
        // Options:
        //   - true (default)
        //   - false
        //
        // pane_frames true

        theme "main"
        default_layout "main-compact"
        mouse_mode true
        //scrollback_editor "/Users/vrodriguez/.nix-profile/bin/nvim"
        scrollback_editor "${pkgs.neovim}/bin/nvim"
      '';

      ".config/zellij/layouts/main-compact.kdl".text = /*kdl*/''
          layout {
            pane size=1 borderless=true {
                plugin location="zellij:compact-bar"
            }
            pane
        }
        pane_frames false
      '';

      ".config/zellij/themes/main.kdl".text =
        let colors = config.theme.scheme;
        in /*kdl*/''
          themes {
              main {
                  fg "${colors.fg_bright}"
                  bg "${colors.bg}"
                  black "${colors.black}"
                  red "${colors.red}"
                  green "${colors.green}"
                  yellow "${colors.yellow}"
                  blue "${colors.blue}"
                  magenta "${colors.magenta}"
                  orange "${colors.idx_16}"
                  cyan "${colors.cyan}"
                  white "${colors.white}"
              }
          }
        '';
    };
  };
}
