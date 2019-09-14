# vim

[Vim](https://www.vim.org/) is the god of the editor, or perhaps is the `neovim`.

This `README.md` will teach you(or future me) how to install and configure it quickly.


<!-- vim-markdown-toc GFM -->

* [Install](#install)
    - [Vim / Neovim](#vim--neovim)
    - [Vim-plug](#vim-plug)
        + [Vim](#vim)
        + [Neovim](#neovim)
* [Configure](#configure)
    - [Vim](#vim-1)
    - [Neovim](#neovim-1)

<!-- vim-markdown-toc -->

## Install
Firstly, verify that you have 'curl', if not, use the `$ sudo pacman -S curl` to install it.

### Vim / Neovim

You can install vim by using these command.

```shell
$ sudo pacman -S vim

// If you want to install neovim
$ sudo pacman -S neovim
```

### Vim-plug

[Vim-plug](https://github.com/junegunn/vim-plug) is a minimalist Vim plugin manager.

So, how to install it?

#### Vim

```shell
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Neovim

```shell
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Configure

Copy the `.vimrc` in this folder to your home folder.

### Vim

```shell
$ cp ${myManjaroiac}/vim/.vimrc ~/
```

### Neovim

```shell
$ mkdir ~/.config/nvim
$ cp ${myManjaroiac}/vim/.vimrc ~/.config/nvim/init.vim
```

Then you can use the command `vim`(or `nvim`) to start a vim(or neovim)

Use the following command to install the plugin.

```vim
:source MYVIMRC
:PlugInstall
```
If you have some problem, you can search it in `Baidu` or `Google`.

Now, you can use you vim(or neovim).

Maybe i will write a user's guide later.
