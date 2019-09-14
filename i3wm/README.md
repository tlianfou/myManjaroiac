# Manjaro-i3wm的安装及其配置

<!-- vim-markdown-toc GFM -->

* [安装Manjaro-i3wm](#安装manjaro-i3wm)
* [> 关于使用i3wm的默认键位](#-关于使用i3wm的默认键位)
* [必要的软件和字体](#必要的软件和字体)
* [中文输入法](#中文输入法)
* [alacritty](#alacritty)
* [i3wm](#i3wm)
* [polybar](#polybar)
* [mpd与ncmpcpp](#mpd与ncmpcpp)

<!-- vim-markdown-toc -->

## 安装Manjaro-i3wm

首先要去到[官网](https://manjaro.org/)下载最新的iso镜像

进入Download界面，这里我们选择Community里面的i3
![选择i3镜像](https://i.loli.net/2019/08/17/vKuyGxYsNCWBchn.png)

![下载镜像](https://i.loli.net/2019/08/17/rvPxMwKpsydbatk.png)

此外我们还需要一个名为rufus的软件，用于装载镜像到U盘
![rufus和iso](https://i.loli.net/2019/08/17/iZCylnAYDL6M4Bj.png)

打开rufus，开始装载镜像，按照图片选择
![image.png](https://i.loli.net/2019/08/17/5lb9JqHeXRdn8Tw.png)

在随后弹出的框中选择**DD模式**，切记不要选错
![image.png](https://i.loli.net/2019/08/17/GPw3CehdZtJY96W.png)

随后重启电脑，进入bios进行设置，这里我们引用小米的bios

首先在security中将secure boot mode设置为enable
![IMG_20190817_210732.jpg](https://i.loli.net/2019/08/17/8m5aXI6YPjc1how.jpg)

接着设置启动磁盘方式为uefi并且设定U盘为最优先启动项
![IMG_20190817_210752.jpg](https://i.loli.net/2019/08/17/nGkAM6yEPsqhHcJ.jpg)
![image.png](https://i.loli.net/2019/08/17/4BrTULfR5cbWP6w.png)

重启电脑，开始安装

可以看到这就是安装界面了，我们要做几个修改，分别是图示中的时间、语言、显卡驱动，最后选择Boot开头的选项，进入安装
![image.png](https://i.loli.net/2019/08/17/6DGBCO9gwTI7hAu.png)

在左上角修改语言为中文，点击启动安装程序
![image.png](https://i.loli.net/2019/08/17/GkQch28ufC7XMjH.png)
随后按照提示一步一步走就好了

安装好之后重启就可以看到我们的Manjaro-i3wm了（如果你看到了W10，那是你默认启动盘设置为了W10的盘，去bios修改吧）

安装好之后我们要做几件事情

1、知道mod+Return是打开终端

2、更改屏幕大小

```
// 在家目录下新建文件(如果没有)
$ vim ~/.Xresources

// 把这个文件的第一行dpi改为一个合适的大小，我使用的是125随后重启电脑
Xft.dpi:125
```

3、你会发现你的电脑左上角和右下角老是有东西，这玩意叫conky，使用命令killall conky就可以杀掉了


> 关于使用i3wm的默认键位
---

## 必要的软件和字体

```
// 必要的字体
$ sudo pacman -S ttf-font-awesome wqy-bitmapfont wqy-microhei wqy-zenhei nerd-fonts-complete ttf-wps-fonts

// variety 桌面壁纸管理软件
// compton i3下的渲染器，在后面可以使alacritty半透明
// polybar 状态栏，这玩意配置过程太恐怖了，但是它太棒了
// rofi 程序启动器
// dmenu 同样是程序启动器
// chromium 谷歌浏览器
// kdenlive 剪辑视频
// vlc 观看视频
// wps-office 不多说，垃圾microsoft office
// code visual-studio-code，用过的都说好
// netease-cloud-music 网易云音乐
// simplescreenrecorder 录屏软件，不过我的电脑录不了声音
// ncmpcpp 搭配mpd一起使用

$ sudo pacman -S variety compton polybar rofi chromium kdenlive vlc
$ sudo pacman -S wps-office netease-cloud-music ncmpcpp
```

## 中文输入法

```
$ sudo pacman -S fcitx fcitx-im fcitx-configtool
$ sudo pacman -S fcitx-sogoupinyin

// 配置中文输入法
$ vim ~/.xprofile
// 输入以下内容
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
// 保存退出，reboot系统
```

## alacritty

```
// 终端 alacritty 和 dmenu（一个程序启动器）
$ sudo pacman -S alacritty

// 打开alacritty，之后可以关闭原来的终端了
$ alacritty
```
这个时候可能发现你的alacritty字符的显示有问题，别慌i,跟着步骤走
```
// 打开alacritty的配置文件
$ vim .config/alacritty/alacritty.yml

//找到下面这句话开头的语段
//# Font configuration (changes require restart)
//更改为（只需要更改并且取消几个注释而已,没有用的东西已经删掉了）
# Font configuration (changes require restart)
font:
  # Normal (roman) font face
  normal:
    family: DejaVu Sans Mono
    style: Regular

  # Bold font face
  bold:
    family: DejaVu Sans Mono
    style: Bold

  # Italic font face
  italic:
    family: DejaVu Sans Mono
    # style: Italic
    # Point size
    size: 11.0

// 哦顺便，改一下字体吧，你现在应该字挺小
// 找到
// # Point size
// 把下面的size改为一个合适的大小，我是11
size: 11.0
```
这个时候退出来应该就已经可以正常显示，接下来设置默认mod+Return打开alacritty
```
// 打开i3的配置文件
$ vim .i3/config

// 找到这么一行
// bindsym $mod+Return exec
// 更改为
bindsym $mod+Return exec alacritty

//保存并退出，并按下mod+Shift+c刷新i3配置就可以了
```

## i3wm

只需要将我的github上的i3目录下的config文件复制到`~/.i3` 目录下再使用重载i3配置的快捷键`mod+Shift+c` 就可以重载i3配置并且使用了

一些我常用的配置我放在文件[Common_shortcuts.md](https://github.com/tlianfou/mi3wmiac/blob/master/Common-shortcuts.md) 里了

## polybar
拷贝配置文件并运行
```
$ cp -rf ${mi3wmiac}/polybar ~/.config/
$ polybar taifu
```

就可以运行（但不是完美）我已经配置好的polybar了，polybar的代码非常简洁易读，很容易就能弄懂，只不过配置自己喜欢的polybar是一件很麻烦的事情，如果想要进行自定义配置，可以去看[官方文档](https://github.com/polybar/polybar/wiki) ，里面的说明非常详细

## mpd与ncmpcpp

安装mpd和ncmpcpp，随后拷贝配置文件并且运行，如果报错就重启试试

```shell
$ sudo pacman -S mpd ncmpcpp
$ cp ${mi3wmiac}/mpd-and-ncmpcpp/config ~/.ncmpcpp
$ cp ${mi3wmiac}/mpd-and-ncmpcpp/mpd.conf
$ mpd
$ ncmpcpp
```





> 连接wifi nmcli  https://blog.csdn.net/shaozuo133/article/details/79060536

> 配置快捷键 alias

> 修改默认目录 (Desktop什么的) .config/user-dirs.dirs
