# rasi.vim - rofi config syntax highlighting for vim

Add syntax highlighting support for rasi config file

The syntax is based on the [rofi-theme man page](https://man.archlinux.org/man/community/rofi/rofi-theme.5.en). (v1.7.2)

![image](https://user-images.githubusercontent.com/34305318/147615642-b53ac720-9681-41dd-adf7-80816a1a5044.png)

## Dependencies
**Optionnal**
- [vim-css-color](https://github.com/ap/vim-css-color) for better color support (see [wiki](https://github.com/Fymyte/rasi.vim/wiki/Integration#colors))

## [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
A parser for rasi has also been created for neovim users at [Fymyte/tree-sitter-rasi](https://github.com/Fymyte/tree-sitter-rasi). [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) has builtin support for it by running
```
:TSInstall rasi
```

## Installation
### vim-plug
```vim 
Plug 'Fymyte/rasi.vim'
```

### [Packer](https://github.com/wbthomason/packer.nvim)
```vim
use {
  'Fymyte/rasi.vim',
  ft = 'rasi',
}
```

## Known issue
rofi config supports `cmyk()` colors but it is currently not highlighted properly.
PR are welcome.

## Thanks
Thanks to [@ii14](https://github.com/ii14/) and [@CantoroMC](https://github.com/CantoroMC) for base plugin.

This project is based on
[ii14/vim-rasi](https://github.com/ii14/vim-rasi)
