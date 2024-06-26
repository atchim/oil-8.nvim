# 🛢️ Oil 8

Oil 8 is a [GUI][gui]-only dark color scheme for [Neovim][nvim] that was mainly
based on the [Oil 6 color palette][oil-6]. Other color schemes inspirations
includes [Sopa de Mamaco][sopa.nvim], [Catppuccin][catppuccin.nvim] and
[Bubblegum][bubblegum].

## ⚠️ Requirements

Oil 8 only requires the [`'background'`]['background'] option set to `dark`.

## ✨ Features

- Dark theme with base colors based on the [Oil 6 color palette][oil-6].
- Colors distributed throughout the spectrum.
- Similar colors have similar meanings.
- [Integration](#-integration) with [nvim-treesitter] and many other plugins.

## 🚀 Usage

To load the color scheme with its default configuration, use the traditional
[`:colorscheme`][:colorscheme] command, as shown below.

```vim
:colorscheme oil-8
```

To load the color scheme with custom configuration, use the
[`setup` function](#oil-8setupconfig), as exemplified in the following Lua code
snippet.

```lua
require'oil-8'.setup{
  -- Terminal color support is disabled by default. Set it to `true` to
  -- enable.
  terminal_colors = false,

  -- By default, most plugins have integration enabled. To disable all plugin
  -- integration, set the `integration` field to `false`.
  integration = {
    neo_tree = false, -- Disables integration for Neo-tree.
    treesitter = true, -- Ensures integration for nvim-treesitter.
    mini = false, -- Disables all integration for Mini plugins.
  },

  -- Set or override highlight groups.
  custom_highlights = function(palette)
    return {
      Conditional = {fg = palette.persian_pink},
      MyHighlightGroup = {fg = palette.inchworm, bold = true},
    }
  end,
}
```

## 🧩 Integration

Oil 8 provides seamlessly theme integration for other plugins of the Neovim's
ecosystem. The integration is configured via the
[`integration` field](#integration) of the configuration table that may be
passed as argument for the [`setup` function](#oil-8setupconfig).

The supported plugins are listed below.

- [Illuminate][vim-illuminate]
- [Indent Blankline][indent-blankline.nvim]
- [Leap][leap.nvim]
- [Mini][mini.nvim]
  - [Indentscope][mini.indentscope]
- [Neo-tree][neo-tree.nvim]
- [nvim-treesitter]

## 📖 API

The following subsections cover each module/submodule composing the Lua API of
Oil 8.

### `oil-8`

Table serving as the main module for this plugin.

#### `oil-8.setup(?config)`

Function for loading the color scheme according to optional `?config` or
their defaults. If no `?config` would be passed to this function, it's
recommended to use `:colorscheme oil-8` instead.

The documentation for `?config` can be found [here](#-configuration).

### `oil-8.palette`

Table serving as the module containing all the colors used by this color
scheme. Each key stands for the color name, with its corresponding value being
a string representing a hex triplet for the color.

The comprehensive list of the colors can be found [here](#-palette).

## 🔧 Configuration

Oil 8 is configured via the configuration table passed as argument to the
[`setup` function](#oil-8setupconfig). The fields of that table are listed and
explained below.

### `custom_highlights`

Function that takes a [palette table](#oil-8palette) and returns a key-value
table where each key stands for the name of the group to be highlighted, and
its corresponding value is a table as specified for the `val` parameter of
[nvim_set_hl()].

This function may be used for setting other highlight groups, or for
overriding existing ones previously set by Oil 8. The following code snippet
exemplifies how to use it.

```lua
require'oil-8'.setup{
  custom_highlights = function(palette)
    return {
      NeoTreeWinSeparator = {link = 'WinSeparator'}
      WinSeparator = {fg = palette.eerie_black, bg = palette.dark_gunmetal},
    }
  end,
}
```

### `integration`

Key-value table controlling which (and how) plugins should be integrated by Oil
8. Each key represents the plugin name in snake case, with the corresponding
value typically being a boolean enabling/disabling the integration for that
plugin.

Setting the `integration` field to `false` will completely disable plugin
integration functionality.

In most cases, plugin integration consists of setting highlight groups specific
to the plugin's functionality.

The keys of the `integration` table (i.e., the plugins supported by Oil 8), and
their corresponding values are listed below.

#### `illuminate`

Boolean controlling whether to enable integration for
[Illuminate][vim-illuminate]. By default, this plugin is integrated by Oil 8.

#### `indent_blankline`

Boolean controlling whether to enable integration for
[Indent Blankline][indent-blankline.nvim]. By default, this plugin is
integrated by Oil 8.

#### `leap`

Boolean controlling whether to enable integration for [Leap][leap.nvim]. By
default, this plugin is integrated by Oil 8.

#### `mini`

Key-value table controlling [Mini][mini.nvim] modules that should be integrated
by Oil 8. Setting the `integration.mini` field to `false` will completely
disable plugin integration functionality for Mini.

##### `indentscope`

Boolean controlling whether to enable integration for
[Indentscope][mini.indentscope]. By default, this plugin is integrated by Oil
8.

#### `neo_tree`

Boolean controlling whether to enable integration for
[Neo-tree][neo-tree.nvim]. By default, this plugin is integrated by Oil 8.

#### `treesitter`

Boolean controlling whether to enable integration for [nvim-treesitter]. By
default, this plugin is integrated by Oil 8.

### `terminal_colors`

Boolean controlling whether Oil 8 should set
[terminal color variables][terminal-config]. By default, it's set to `false`.

## 🎨 Palette

| Name                  | Hex       | HSL         | L\*a\*b\*    |
|-----------------------|-----------|-------------|--------------|
| `eerie_black`         | `#171629` | `243 30 12` | ` 8   6 -12` |
| `dark_gunmetal`       | `#1c1b34` | `242 31 15` | `11   8 -16` |
| `space_cadet`         | `#292449` | `248 33 21` | `16  13 -22` |
| `cyber_grape`         | `#5f4c73` | `269 20 37` | `35  16 -19` |
| `antique_fuchsia`     | `#8c607b` | `323 18 46` | `46  22  -7` |
| `burnished_brown`     | `#a77d72` | ` 12 23 55` | `56  14  12` |
| `ecru`                | `#bdab87` | ` 40 29 63` | `70   0  20` |
| `bone`                | `#e1e0c4` | ` 57 32 82` | `88  -4  13` |
| `caput_mortuum`       | `#622d2d` | `  0 37 28` | `25  23  11` |
| `english_red`         | `#aa3c55` | `346 47 45` | `41  47   9` |
| `brink_pink`          | `#f35e7c` | `347 86 66` | `60  59  13` |
| `tulip`               | `#fe7c8d` | `352 98 74` | `67  50  14` |
| `dark_lava`           | `#4b3a30` | ` 22 21 24` | `25   5   9` |
| `dirty_brown`         | `#b25c1f` | ` 24 70 40` | `48  30  48` |
| `big_foot_feet`       | `#f38f5e` | ` 19 86 66` | `69  33  42` |
| `macaroni_and_cheese` | `#fab98a` | ` 25 91 76` | `80  17  33` |
| `bronze_yellow`       | `#606c09` | ` 67 84 22` | `43 -16  46` |
| `acid_green`          | `#bbbd28` | ` 60 65 44` | `74 -17  68` |
| `chinese_green`       | `#d4e05c` | ` 65 68 61` | `86 -21  61` |
| `inchworm`            | `#bcec6a` | ` 82 77 67` | `87 -35  57` |
| `kombu_green`         | `#31452b` | `106 23 21` | `26 -13  13` |
| `green_ryb`           | `#4eb332` | `106 56 44` | `65 -52  54` |
| `mantis`              | `#72db5e` | `110 63 61` | `79 -53  51` |
| `medium_aquamarine`   | `#6ceaa7` | `148 75 67` | `84 -50  22` |
| `brunswick_green`     | `#1b5c4d` | `166 54 23` | `34 -24   2` |
| `jungle_green`        | `#2d9f84` | `165 55 40` | `58 -38   5` |
| `turquoise`           | `#58e9ca` | `167 76 62` | `84 -45   3` |
| `middle_blue`         | `#84cfdd` | `189 56 69` | `78 -19 -14` |
| `ateneo_blue`         | `#367ba6` | `203 50 43` | `49  -7 -29` |
| `steel_blue`          | `#024c67` | `196 96 20` | `29  -9 -21` |
| `blue_jeans`          | `#54b7e8` | `199 76 61` | `70 -14 -33` |
| `baby_blue_eyes`      | `#a4b6fe` | `228 97 81` | `75  10 -37` |
| `pixie_powder`        | `#3e2187` | `257 60 32` | `23  39 -52` |
| `blue_pigment`        | `#413aa1` | `244 47 42` | `31  33 -55` |
| `violets_are_blue`    | `#966ef2` | `258 83 69` | `56  44 -61` |
| `mauve`               | `#dd9ffe` | `278 98 80` | `74  39 -38` |
| `japanese_violet`     | `#592a5f` | `293 38 26` | `25  30 -22` |
| `byzantine`           | `#b22ab7` | `297 62 44` | `45  66 -45` |
| `light_deep_pink`     | `#e557cd` | `310 73 61` | `59  68 -33` |
| `light_deep_pink`     | `#fc83c5` | `327 95 75` | `70  53 -13` |

['background']: https://neovim.io/doc/user/options.html#'background'
[bubblegum]: https://github.com/baskerville/bubblegum
[catppuccin.nvim]: https://github.com/catppuccin/nvim
[:colorscheme]: https://neovim.io/doc/user/syntax.html#%3Acolorscheme
[gui]: https://neovim.io/doc/user/gui.html#gui
[indent-blankline.nvim]: https://github.com/lukas-reineke/indent-blankline.nvim
[leap.nvim]: https://github.com/ggandor/leap.nvim
[mini.indentscope]: https://github.com/echasnovski/mini.indentscope
[mini.nvim]: https://github.com/echasnovski/mini.nvim
[neo-tree.nvim]: https://github.com/nvim-neo-tree/neo-tree.nvim
[nvim]: https://neovim.io
[nvim_set_hl()]: https://neovim.io/doc/user/api.html#nvim_set_hl()
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[oil-6]: https://lospec.com/palette-list/oil-6
[sopa.nvim]: https://github.com/atchim/sopa.nvim
[terminal-config]: https://neovim.io/doc/user/nvim_terminal_emulator.html#terminal-config
[vim-illuminate]: https://github.com/RRethy/vim-illuminate