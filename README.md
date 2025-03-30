# 42cadet_bootstrap

<!-- mtoc-start -->

* [Description](#description)
* [Usage](#usage)
* [Tool Glossary](#tool-glossary)
  * [Terminal](#terminal)
  * [System Package Manager](#system-package-manager)
  * [Version Control](#version-control)
  * [Shell](#shell)
  * [Multiplexer](#multiplexer)
  * [Text Editor](#text-editor)
  * [Pager](#pager)
  * [Debug](#debug)
  * [Documentation](#documentation)

<!-- mtoc-end -->

![Bootstrap 42](./img/bootstrap42.png)

## Description

This repository serves as a `bootstrap tool` to kickstart your terminal experience,
streamlining the installation process, ensuring you got a strong foundation to
build your own `PDE` (Personalized Developement Enviroment).

> Why use someone else's opinionated `IDE` when you can have your very own terminal
> `PDE`? 🙃

The `42cadet_bootstrap` also offers an introductory "Terminal Glossary", referencing
crucial tools that will become your confidants throughout your 42 journey. While
not exhaustive, this glossary provides a "bundle of pointer" to help you navigate
the enourmous depths of computer science. Dive deep into the realm of 0s and 1s and
get a little closer to becoming a terminal pro @ 42!

## Usage

* Download the bootstrap `.dotfiles` to your HOME directory:

```sh
git clone git@github.com:PedroZappa/42cadet_bootstrap.git ~/.dotfiles

```

* Install `Homebrew Package Manager`:

> Tested @ 42 Porto campus.

```sh
~/.dotfiles/scripts/brew42.sh
```

* Install Homebrew starter packages (in a new shell):

```sh
~/.dotfiles/scripts/starter-brew.sh
```

* Install `zsh`s package Manager

```sh
~/.dotfiles/scripts/zap.sh
```

> [Homebrew Formulae](https://formulae.brew.sh/)

* Symlink the dotfiles:

```sh
~/.dotfiles/scripts/sym.sh
```

____

## Tool Glossary

### Terminal

* [Ghostty](https://ghostty.org/)

### System Package Manager

* [Homebrew](https://brew.sh/)

### Version Control

* [Git](https://git-scm.com/)

> [git-config](https://git-scm.com/docs/git-config)
> [gitignore](https://git-scm.com/docs/gitignore)

* [GitHub](https://github.com/)

### Shell

* [zsh (The Z Shell Manual)](https://zsh-manual.netlify.app/the-z-shell-manual)

> [zsh configuration files](https://www.baeldung.com/linux/zsh-configuration-files)
> [How do zsh Configuration Files Work?](https://www.freecodecamp.org/news/how-do-zsh-configuration-files-work/)

* [Zap Package Manager](https://www.zapzsh.com/)

* [Starship Prompt](https://starship.rs/)

### Multiplexer

* [tmux](https://tmux.github.io/)

### Text Editor

* [Neovim](https://neovim.io/)

> [Lazy.nvim (Plugin Manager)](https://github.com/folke/lazy.nvim)
>
> [Mason.nvim (Package Manager)](https://github.com/williamboman/mason.nvim)
>
> [nvim-lspconfig (Plugin {LSP})](https://github.com/neovim/nvim-lspconfig)
>
> [fidget.nvim (Plugin {LSP Notifications})](https://github.com/j-hui/fidget.nvim)
>
> [blink.cmp (Plugin {Completion})](https://github.com/Saghen/blink.cmp)
>
> [markview.nvim (Plugin {Preview})](https://github.com/OXY2DEV/markview.nvim)
>
> [nvim-treesitter (Plugin {Syntax Highlighting})](https://github.com/nvim-treesitter/nvim-treesitter)
>
> [nvim-ufo (Plugin {Folding})](https://github.com/kevinhwang91/nvim-ufo)
>
> [neo-tree.nvim (Plugin {File Explorer}](https://github.com/nvim-neo-tree/neo-tree.nvim)]
>
> [oil.nvim (Plugin {File Explorer})](https://github.com/stevearc/oil.nvim)
>
> [which-key.nvim (Plugin {Keybindings})](https://github.com/folke/which-key.nvim)
>
> [snacks.nvim (Plugin {QoL})](https://github.com/folke/snacks.nvim)
>
> AI Integration (Off by default)
>
> [copilot.lua (Plugin {AI})](https://github.com/zbirenbaum/copilot.lua)
>
> [avante.nvim (Plugin {AI})](https://github.com/yetone/avante.nvim)
>
> Add more...

* [Vim](https://www.vim.org/)

* [Editorconfig](https://editorconfig.org/)

### Pager

* [bat](https://github.com/sharkdp/bat)

### Debug

* [GDB (GNU Debugger)](https://sourceware.org/gdb/current/onlinedocs/gdb)

* [Valgrind (Intrumentation Framework)](https://valgrind.org/)

### Documentation

* [Doxygen](https://www.doxygen./)

____
