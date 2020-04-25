# My installation and configure of Linux(Manjaro)

This repositories is my experience on install Linux(Manjaro)

> 推荐教程 : [https://www.cnblogs.com/Jaywhen-xiang/p/11561661.html](https://www.cnblogs.com/Jaywhen-xiang/p/11561661.html)

<!-- vim-markdown-toc GFM -->

* [I3wm](#i3wm)
* [Kde](#kde)
* [Vim](#vim)
* [Pacman](#pacman)
* [Fish](#fish)

<!-- vim-markdown-toc -->

## I3wm
This is the introduction about [i3wm](https://wiki.archlinux.org/index.php/I3)(i3)

If you want to install the i3wm, i wrote a document to teach you(or future me) how to install it.

You can go and read the [README.md](./README.md).

## Kde
You may know the `KDE plassma` in some places, if you want to install it, you can find a lot of tutorials online.

Configuration the `KDE plassma` is a very interesting process.

Hurry and try it!

## Vim
[Vim](https://www.vim.org/) is the god of the editor, or perhaps is the `neovim`.

You can go to the folder named `vim` and read the [README.md](./vim/README.md) in that folder.

## Pacman

[Pacman](https://wiki.archlinux.org/index.php/pacman) is a package manager that I think is better.

If you want to know more about how to use Pacman, you can go to the folder named `pacman` and read the [README.md](./pacman/README.md) in that folder.

## Fish

[Fish shell](http://fishshell.com/) is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family.

You can install and configure and use fish with the following instructions.

```shell
// Install
$ sudo pacman -S fish

// Check out the installation lacation of the fish (usually in '/usr/bin/fish')
$ which fish

// Switch the default shell to fish，path is the path obtained by the previous command
// Warning：This command do not use the 'sudo'
$ chsh -s /usr/bin/fish

// Install oh-my-fish
$ curl -L https://get.oh-my.fish | fish

// You can enter this command to change the theme of fish quickly.
$ fish_config

```

You can go the [oh-my-fish on github](https://github.com/oh-my-fish/oh-my-fish) to know how to use it.

Or you can [click here](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md) to find the themes you like. And install the theme by `omf install <name>`, use the theme by `omf theme <name>`.
