# Pacman
[Pacman](https://wiki.archlinux.org/index.php/pacman) is a package manager that I think is better.


<!-- vim-markdown-toc GFM -->

- [添加镜像源并且更新镜像源](#添加镜像源并且更新镜像源)
- [常用指令](#常用指令)

<!-- vim-markdown-toc -->

### 添加镜像源并且更新镜像源

拷贝配置文件并且执行更新命令
```
$ sudo cp ${mi3wmiac}/archlinuxcn /etc/pacman.d/
$ sudo cp ${mi3wmiac}/pacman/pacman.conf /etc/
$ sudo pacman-mirrors -c China
$ sudo pacman -Syyu
```
之后一路回车并且等待安装更新

安装好之后重启电脑

### 常用指令

| 指令              | 功能                                         | 备注                             |
|-------------------|----------------------------------------------|----------------------------------|
| S                 | 安装软件                                     |                                  |
| Syyu              | 强行获取最新的软件并且更新                   | 如果只有Sy将无法证明一定是最新的 |
| Ss "name"         | 搜索所有软件中有name的软件                   | 支持正则表达式                   |
| Sc                | 删除缓存中的安装包                           | 不删除也有一定好处               |
| R "name"          | 删除名为name的软件                           | 无法完全删除，因为存在依赖软件   |
| Rs "name"         | 删除名为name的软件及其依赖软件               | 不会删除全局配置文件             |
| Rns "name"        | 删除名为name的软件及其依赖软件和全局配置文件 |                                  |
| Q                 | 显示所有已安装的软件                         |                                  |
| Qe                | 显示所有用户自己安装的软件                   |                                  |
| Qeq               | 显示所有用户自己安装的软件并且不显示版本号   | 可以用于批量重装软件             |
| Qs "name"         | 显示所有已安装软件中带name的软件             |                                  |
| Qdt               | 查询不再被需要的（依赖）软件                 |                                  |
| R $(pacman -Qdtq) | 删除所有不再被需要的软件                     | fish是不需要$符和括号的          |

