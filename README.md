# Manjaro-i3wm的安装及其配置

[TOC]

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

## 添加镜像源并且更新镜像源

在terminal下输入指令，进入pacman的配置文件

```
$ sudo nano /etc/pacman.conf
```
（使用nano是因为默认没有vim）

在最后一行添加以下代码并保存退出
```
[archlinuxcn]
SigLevel = Never
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

最后执行命令
```
$ sudo pacman-mirrors -c China
$ sudo pacman -Syyu
```
之后一路回车并且等待安装更新

安装好之后reboot电脑

## vim
```
// 安装vim和curl
$ sudo pacman -S vim curl

// 安装必要的配置文件
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ sudo pacman -S nodejs yarn

// 复制我github目录下vim文件夹下的.vimrc文件至你的home目录
$ cp ${github}/vim/.vimrc ~/

//重载vim，即使有报错也不用管，一路回车
$ source ~/.vimrc
```
随后在vim中键入指令
```
:PlugInstall
```
等待配置安装，安装好之后Q退出安装界面，Shitf+q退出vim

vim配置完成

## pacman
```
$ sudo vim /etc/pacman.conf
```
将Color这一行取消注释，pacman就会拥有颜色的区分

## fish
```
// 安装fish
$ sudo pacman -S fish

// 检查fish的安装位置（一般为/usr/bin/fish）
$ which fish

// 切换默认shell为fish，目录是你上个命令得到的目录，这里我使用一般情况
// Warning：这个命令不要用sudo
$ chsh -s /usr/bin/fish

// 安装oh-my-fish
$ curl -L https://get.oh-my.fish | fish

```
> fish的主题的更换以后再说

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

## 拷贝我的配置们
```

```

> 连接wifi nmcli  https://blog.csdn.net/shaozuo133/article/details/79060536

> 配置快捷键 alias

> 修改默认目录 (Desktop什么的) .config/user-dirs.dirs
