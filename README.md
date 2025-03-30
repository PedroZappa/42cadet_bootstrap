# 42cadet_bootstrap

<!-- mtoc-start -->

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

<!-- mtoc-end -->

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

### Shell

* [zsh (The Z Shell Manual)](https://zsh-manual.netlify.app/the-z-shell-manual)

* [Zap  Package Manager](https://www.zapzsh.com/)

* [Starship Prompt](https://starship.rs/)

### Multiplexer

* [tmux](https://tmux.github.io/)

### Text Editor

* [Neovim](https://neovim.io/)

* [Vim](https://www.vim.org/)

* [Editorconfig](https://editorconfig.org/)

### Pager

* [bat](https://github.com/sharkdp/bat)

### Debug

* [GDB (GNU Debugger)](https://sourceware.org/gdb/current/onlinedocs/gdb)

* [Valgrind (Intrumentation Framework)](https://valgrind.org/)

____
