# rasi.vim - rofi config syntax highlighting for vim

Add syntax highlighting support for rasi config file

The syntax is based on the [rofi-theme man page](https://man.archlinux.org/man/community/rofi/rofi-theme.5.en). (v1.7.2)

![image](https://user-images.githubusercontent.com/34305318/154325014-07745a20-de25-4df5-b66a-e767e48c8f38.png)

<details>
<summary>With tree-sitter highlighting:</summary>
  <img alt="Tree-sitter showcase" src="https://user-images.githubusercontent.com/34305318/154324309-ca639702-b561-4fcd-8c30-fa12ef4fa10e.png">
</details>

Colorscheme: [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)

## Dependencies
**Optionnal**
- [vim-css-color](https://github.com/ap/vim-css-color) for better color support (see [wiki](https://github.com/Fymyte/rasi.vim/wiki/Integration#colors))

## [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
A parser for rasi has also been created for neovim users at [Fymyte/tree-sitter-rasi](https://github.com/Fymyte/tree-sitter-rasi).
The parser doesn't add much highlighting but may recognize some structure that are impossible to express through regex.
(particularly nested `var`, `env` ...)

See [wiki](https://github.com/Fymyte/rasi.vim/wiki/Integration#treesitter) for integration.

## Installation
### vim-plug
```vim 
Plug 'Fymyte/rasi.vim'
```

### [Packer](https://github.com/wbthomason/packer.nvim)
```lua
use {
  'Fymyte/rasi.vim',
  ft = 'rasi',
}
```

## Thanks
- [@CantoroMC](https://github.com/CantoroMC) for base plugin. (repository has been deleted)
