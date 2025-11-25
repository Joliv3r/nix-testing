{ pkgs, ... }:

let
  keymap = pkgs.writeText "keymap.xkb" ''
    xkb_keymap {
      xkb_keycodes  { include "evdev+aliases(qwerty)"	};
      xkb_types     { include "complete"	};
      xkb_compat    { include "complete"	};
      xkb_geometry  { include "pc(pc104)"	};
      xkb_symbols   { 
        include "pc+us+inet(evdev)+ctrl(nocaps)"	
        key <RALT> { [ ISO_Level3_Shift ] };
        modifier_map Mod5 { <RALT> };
        key <AC04> { 
          type = "FOUR_LEVEL_SEMIALPHABETIC",
          symbols[Group1] = [ f, F, backslash, backslash ] 
        };
      };
    };
  '';
in 
{
  environment.systemPackages = with pkgs; [
    xorg.xkbcomp
  ];

  # Applying this is handled by i3 when starting and changing keyboard layouts.
  environment.etc."X11/keymap.xkb".source = keymap;
}
