export const device = #{
    laptop: SYSTEM.hostname == "lenovo",
};

const themes = #{
    orange: #{
      bg_l: "#282A2E",
      fg_l: "#50545B",
      fr_l: "#F0C674",
      bg: "#282A2E",
      fg: "#DDDDDD",
      fr: "#F0C674",
      bg_c: "#900000",
      fg_c: "#FFFFFF",
      fr_c: "#FF0000",
    },
    green : #{
      bg_l: "#191919",
      fg_l: "#50545B",
      fr_l: "#98C379",
      bg: "#191919",
      fg: "#ABB2BD",
      fr: "#98C379",
      bg_c: "#900000",
      fg_c: "#FFFFFF",
      fr_c: "#FF0000",
    },
};

export const theme = #{
    colors: if io::env("THEME", "") == "orange" { themes.orange } else { themes.green },
};

export let eggs = #{
  bspwm: #{
      enabled: true,
      strategy: "put",
      templates: ["bspwmrc"],
      targets: "~/.config/bspwm",
      main_file: "bspwmrc",
    },
    dunst: #{
        enabled: true,
        strategy: "put",
        templates: ["dunstrc"],
        targets: "~/.config/dunst",
      },
    kitty: #{
      enabled: true, 
      strategy: "put", 
      templates: ["kitty.conf"], 
      targets: "~/.config/kitty",
      main_file: "kitty.conf" },
    alacritty: #{
      enabled: true, 
      strategy: "put", 
      templates: ["alacritty.toml"], 
      targets: "~/.config/alacritty",
      main_file: "alacritty.toml" },
    polybar: #{
        enabled: true,
        startegy: "put",
        templates: [ "colors.ini", "config.ini", "modules.ini" ],
        targets: "~/.config/polybar",
        main_file: "config.ini",
      },
    picom: #{enabled: true, strategy: "put", targets: "~/.config/picom", main_file: "picom.conf" },
    rofi: #{
      enabled: true,
      strategy: "put",
      templates: ["shared/colors.rasi"],
      targets: "~/.config/rofi",
      main_file: "config.rasi" },
    sxhkd: #{enabled: true, strategy: "put", targets: "~/.config/sxhkd", main_file: "sxhkdrc" },
  };
