# The installation and configuration of Manjaro-i3wm

<!-- vim-markdown-toc GFM -->

* [Install Manjaro-i3wm](#install-manjaro-i3wm)
    - [We must do something after the installation is complete.](#we-must-do-something-after-the-installation-is-complete)
* [Required software and fonts](#required-software-and-fonts)
* [Alacritty](#alacritty)

<!-- vim-markdown-toc -->

## Install Manjaro-i3wm

The first thing to do is go to the [official website](https://manjaro.org/) to install the newest iso image file.

Enter the "Download" interface, here we choose the "i3" in the "Community" interface.

In addition, we also need a software called "rufus", it can help us load the iso into our USB.

open the "rufus" to load iso, select options by content of the image.

![image](https://i.loli.net/2019/08/17/5lb9JqHeXRdn8Tw.png)

Press `start` and select the `DD mode` in the pop-up window, remember don't to choose the wrong option.

Now, you can reboot your computer and go into bios to set.

1. in the interface of `Security` you must change the `secure boot` to be `enable`
2. in the interface of `boot` you must change the `Boot mode` to be `UEFI Boot Type` and set your USB to be the top priority option to open the computer.

Then reboot your computer and you can start to install your Manjaro-i3wm!

Change the language to Chinese from the upper left corner and then click `start up install programmer`

Now, you can install the Manjaro-i3wm by follow the prompts.

When you complete your install, reboot your computer and then...

YOU CAN SEE YOUR MANJARO-I3WM!!!

```
If you don't see it, that must be you choose the defult startup disk is your Windows10's disk.
CHANGE IT!!!
```

### We must do something after the installation is complete.

1. To know the key `mod+Return` is to open your terminal.
2. Change the dpi of your screen.
    ```shell
    $ vim ~/.Xresources

    // the first line is "Xft.dpi", change it number to a suitable number.
    // my number is 125
    Xft.dpi:125
    ```
    Then reboot your computer, your dpi is changed now.
3. The text on the upper right corner and the lower left corner is called `conky`. You can use the command `$ killall conky` to remove it.

## Required software and fonts

```shell
// Required fonts
$ sudo pacman -S ttf-font-awesome wqy-bitmapfont wqy-microhei wqy-zenhei nerd-fonts-complete ttf-wps-fonts

// variety: the management of the wallpaper
// compton: a renderer in the Manjaro-i3wm, it can make the alacritty become transparent
// polybar: status bar, the process of the configuration of this thing is so terror, but this things is awesome!
// rofi: a program launcher
// dmenu: another program launcher
// chromium: a lightweight brower develop by google
// kdenlive: to clip video
// wps-office: garbage Microsoft!!!
// code: visual studio code
// netease-cloud-music: wangyiyun
// simplescreenrecorder: screen recording software, but my computer can't recording the sound
// ncmpcpp: match the mpd to use

$ sudo pacman -S variety compton polybar rofi dmenu chromium kdenlive
$ sudo pacman -S wps-office code netease-cloud-music simplescreenrecorder ncmpcpp
```

## Alacritty
[Alacryitty](https://github.com/jwilm/alacritty) is a cross-platform,GPU-accelerated terminal emulator.

If you want to use it on you `i3wm`, first you must to install it.

```shell
$ sudo pacman -S alacritty
```

If you want to change your default terminal become the alacritty, open your configuration file of i3wm. Then find the `mod+Return`








