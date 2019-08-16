# 这是一个安装Manjaro-i3wm的技术总结

## 1、安装Manjaro-i3wm

更改屏幕大小
```
// 在家目录下新建文件
$ vim ~/.Xresources

// 把这个文件的第一行dpi改为一个合适的大小，我使用的是125随后重启电脑
Xft.dpi:125
```

你会发现你的电脑左上角和右下角老是有东西，这玩意叫conky，使用命令killall conky就可以杀掉了
> 关于使用i3wm的默认键位
---

## 2、添加镜像源并且更新镜像源

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

## 3、安装并配置vim
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

## 4、使pacman有颜色
```
$ sudo vim /etc/pacman.conf
```
将Color这一行取消注释，保存退出即可

## 5、更换shell为fish并配置
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

## 6、更换终端并配置
```
// 终端 alacritty 和 dmenu（一个程序启动器）
$ sudo pacman -S alacritty dmenu

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
## 7、安装必要的软件和文字
```
// 必要的字体
$ sudo pacman -S ttf-font-awesome wqy-bitmapfont wqy-microhei wqy-zenhei nerd-fonts-complete ttf-wps-fonts

// variety 桌面壁纸管理软件
// compton i3下的渲染器，在后面可以使alacritty半透明
// polybar 
// rofi 可选择作为i3的另外一个程序启动器
// google-chrome 谷歌浏览器
// kdenlive 剪辑视频
// vlc 观看视频
// wps-office 不多说，垃圾microsoft office
// code visual-studio-code，用过的都说好
// netease-cloud-music 网易云音乐
// simplescreenrecorder 录屏软件，不过我的电脑录不了声音
$ sudo pacman -S variety compton polybar rofi google-chrome kdenlive vlc 
$ sudo pacman -S wps-office netease-cloud-music

// 安装中文输入法fcitx
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
