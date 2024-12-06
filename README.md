# keyinput-delayer.nvim

## Features

Delays key input.

Provides a `f**king s**t` experience.
e.g. low bandwidth, using HDD, and RAM 1GB.

Once you get used to this plugin, you can to edit text with fewer actions (obviously).

## Usage

```vim
:Rocks install keyinput-delayer.nvim
```

### Command

```vim
:ToggleKeyInputDelay
:EnableKeyInputDelay
:DisableKeyInputDelay
```

## Configuration

if you LOVE configuring:

```lua
require("keyinput-delayer").setup({
    use_default_config = false,
})
```
