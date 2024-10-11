## System Configurations

- CPU: i7-13700
- GPU: RX 7800XT
- OS:  OpenSUSE Tumbleweed
- DE:  Hyprland

## Hyprland 配置

1. 安装 hyprland

    ```sh
    sudo zypper in --no-recommends hyprland
    ```

## v2ray 配置

1. 安装 `v2ray-core`

    ```sh
    sudo zypper in --no-recommends v2ray-core
    ```

2. 安装 [v2raya](https://github.com/v2rayA/v2rayA/releases)
3. 配置 `v2ray-core` 和 `v2raya` 开机自启动

    ```sh
    sudo vim /usr/lib/systemd/system/v2raya.service
    # ---- BEGIN ----
    [Unit]
    Description=v2rayA Service
    Documentation=https://github.com/v2rayA/v2rayA/wiki
    After=network.target network-online.target nss-lookup.target iptables.service ip6tables.service nftables.service
    Wants=network.target

    [Service]
    Type=simple
    User=root
    LimitNPROC=500
    LimitNOFILE=1000000
    ExecStart=/usr/bin/v2raya --log-disable-timestamp
    Environment=V2RAYA_LOG_FILE=/var/log/v2raya/v2raya.log
    EnvironmentFile=-/etc/default/v2raya
    Restart=on-failure

    [Install]
    WantedBy=multi-user.target
    # ----- END -----

    sudo systemctl enable --now v2ray.service
    sudo systemctl enable --now v2raya.service
    ```

## 中文输入法配置

- 方案: fcitx5 + fcitx5-rime + rime-ice

1. 安装 fcitx5

    ```sh
    sudo zypper in --no-recommends fcitx5 fcitx5-rime
    ```

2. 配置系统环境变量

    ```sh
    # 通用配置方式
    sudo vim /etc/environment
    # ---- BEGIN ----
    QT_IM_MODULE=fcitx
    GTK_IM_MODULE=fcitx
    SDL_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    GLFW_IM_MODULE=ibus
    # ----- END -----

    # Hyprland 配置方式
    vim ~/.config/hypr/hyprland.conf
    # ---- BEGIN ----
    env = QT_IM_MODULE,fcitx
    env = GTK_IM_MODULE,fcitx
    env = SDL_IM_MODULE,fcitx
    env = XMODIFIERS,@im=fcitx
    env = GLFW_IM_MODULE,ibus
    # ----- END -----
    ```

3. 通过 `fcitx5-diagnose` 查看配置问题
4. 下载 [rime-ice](https://github.com/iDvel/rime-ice.git) 到 `~/.local/share/fcitx5/rime` 目录
5. 打开 `fcitx5-configtool` 添加 `rime` 输入法
6. 配置皮肤

## waybar 配置问题

- 在脚本使用 nmcli 连接 wifi 时提示权限不足

    1. 通过 `which nmcli` 查看绝对路径
    2. 修改 `sudoers` 为当前用户添加 `nmcli` 命令的 `NOPASSWD` 权限

    ```sh
    ${username} ALL=(ALL:ALL) NOPASSWD: /usr/bin/nmcli
    ```

    **有教程提出将当前用户添加到 `network` 组中, 但是 `OpenSUSE` 没有该用户组**

- 配置 `keyboard-state` 需要将当前用户添加到 `input` 组中

    ```sh
    sudo usermod -aG input $USER
    ```

## ags 配置 (未使用)

1. 安装 ags 依赖

- meson
- glib2-devel
- gobject-introspection-devel
- libgjs-devel
- gtk3-devle
- libpulse-devel
- pam-devel
- typescript
- typelib-1_0-GtkLayerShell-0_1
- typelib-1_0-DbusmenuGtk3-0_4
- typelib-1_0-Dbusmenu-0_4
- libdbusmenu-gtk3-4
- libnotify-devel
- swww
- libgnome-bluetooth
- typelib-1_0-GnomeBluetooth-3_0
- hyprpicker
- curl -fsSL https://bun.sh/install | bash
- sudo npm install -g sass
- sudo zypper in --no-recommends fd gnome-control-center

## 微信

```sh
flatpak install com.tencent.WeChat
```

## Steam

1. 安装 steam

    ```sh
    sudo zypper in --no-recommends steam
    ```

2. Steam->设置->兼容性->为所有其他产品启用 Steam Play
3. 选择 Proton 版本
4. 安装依赖库

    ```sh
    
    ```

## Mangohud 游戏性能监控

1. 安装 mangohud

    ```sh
    sudo zypper in --no-recommends mangohud
    ```

2. Steam 游戏 `右键->属性->通用->启动选项` 添加启动参数 `mangohud %command%`
3. 显示配置

## LACT 显卡管理

1. 计算合适的内核参数配置 [archwiki](https://wiki.archlinux.org/title/AMDGPU#Boot_parameter)

    ```sh
    printf 'amdgpu.ppfeaturemask=0x%x\n' "$(($(cat /sys/module/amdgpu/parameters/ppfeaturemask) | 0x4000))" # amdgpu.ppfeaturemask=0xfff7ffff
    ```

2. 添加内核参数

    ```sh
    # grub
    sudo vim /etc/default/grub
    # ---- BEGIN ----
    GRUB_CMDLINE_LINUX_DEFAULT="... amdgpu.ppfeaturemask=0xfff7ffff"
    # ----  END  ----

    grub2-mkconfig -o /boot/grub2/grub.cfg
    ```

3. 安装 [LACT](https://github.com/ilya-zlobintsev/LACT/releases)

    ```sh
    sudo rpm --nosignature -i lact.rpm
    sudo systemctl enable --now lactd
    ```

    **OpenSUSE 需要修改配置文件 `/etc/lact/config.yaml` 将 username 或 group 添加到 admin_groups 下, 然后 `sudo systemctl restart lactd`**

## 自动识别并挂载 USB 设备

1. 安装 `udiskie`

    ```sh
    sudo zypper in --no-recommends udiskie
    ```

2. 配置 `waybar` 图标实现点击 `umount`

    // TODO

