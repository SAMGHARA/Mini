# my neovim config

# reference

> https://github.com/LunarVim/Neovim-from-scratch  
> https://github.com/NvChad/NvChad  
> https://github.com/yaocccc/nvim

# others

## nvim-treesitter 配置代理

使用 `https://ghproxy.com` 代理下载. thanks GitHub Proxy !

```lua
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub("https://github.com/",
        "https://ghproxy.com/https://github.com/")
end
```

## nvim 与主机剪贴板互通

> https://www.cnblogs.com/huahuayu/p/12235242.html

1. 安装 xclip

```sh
$ sudo pacman -S xclip
````

2. 修改 nvim 配置

```lua
-- ',' 后面不能有空格

-- lua style
vim.opt.clipboard:prepend { "unnamed,unnamedplus" }

-- vimscript style
set clipboard^=unnamed,unnamedplus
```

3. wsl 下 nvim 与主机剪贴板互通

> https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

```sh
$ curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
$ unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
$ chmod +x /tmp/win32yank.exe
$ sudo mv /tmp/win32yank.exe /usr/local/bin/
```

然后执行第2步的修改，如果安装了 `xclip` 需要先卸载，可以执行 `checkhealth` 查看 `Clipboard (optional)` 状态


