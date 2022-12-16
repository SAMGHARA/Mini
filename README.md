<!-- markdownlint-disable MD013 -->
# my neovim config

## reference

> <https://github.com/LunarVim/Neovim-from-scratch>  
> <https://github.com/NvChad/NvChad>  
> <https://github.com/yaocccc/nvim>

## 配置问题记录

### packer.nvim 下载插件速度慢

> <https://www.bilibili.com/read/cv16639595>

在 `packer` 配置下修改 `default_url_format`，**前提: 本地 git 与 github 已经配置好 ssh 密钥连接**

```lua
require('packer').startup({
    config = {
        git = {
            default_url_format = "git@github.com:%s"
        }
    }
})
```

### packer.nvim 特定文件类型加载插件

在加载插件时添加 `ft = { "lua", "json"... }` 配置。

如果文件没有类型，如 `*.snippets` 文件，可以通过 `vim.filetype.add`进行自定义:

```lua
vim.filetype.add({
    pattern = {
        ['.*%.snippets'] = 'snippets',  -- 定义 *.snippets 文件类型为 snippets
    },
})
```

### nvim-treesitter 配置代理

使用 `https://ghproxy.com` 代理下载. thanks GitHub Proxy !

```lua
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub("https://github.com/",
        "https://ghproxy.com/https://github.com/")
end
```

### nvim 与主机剪贴板互通

> <https://www.cnblogs.com/huahuayu/p/12235242.html>

1. 安装 xclip

    ```sh
    sudo pacman -S xclip
    ````

2. 修改 nvim 配置

    ```lua
    -- ',' 后面不能有空格

    -- lua style
    vim.opt.clipboard:prepend { "unnamed,unnamedplus" }

    -- vimscript style
    set clipboard^=unnamed,unnamedplus
    ```

3. windows wsl 下 nvim 与主机剪贴板互通

    - 方案一: <https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl>

    ```sh
    curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    chmod +x /tmp/win32yank.exe
    sudo mv /tmp/win32yank.exe /usr/local/bin/
    ```

    然后执行第2步的修改，如果安装了 `xclip` 需要先卸载，可以执行 `checkhealth` 查看 `Clipboard (optional)` 状态

    解决配置 `clipboard` 后启动速度慢的问题: <https://github.com/neovim/neovim/issues/9570>. 添加配置:

    ```lua
    vim.cmd([[
        let g:clipboard = {
        \ 'name': 'win32yank',
        \ 'copy': {
        \    '+': 'win32yank.exe -i --crlf',
        \    '*': 'win32yank.exe -i --crlf',
        \  },
        \ 'paste': {
        \    '+': 'win32yank.exe -o --lf',
        \    '*': 'win32yank.exe -o --lf',
        \ },
        \ 'cache_enabled': 0,
        \ }
    ]])
    ```

    - 方案二: 查看nvim帮助文档 `:help clipboard-wsl`. 不需要额外安装软件，只需要添加配置:

    ```lua
    vim.cmd([[
    let g:clipboard = {
        \   'name': 'WslClipboard',
        \   'copy': {
        \      '+': 'clip.exe',
        \      '*': 'clip.exe',
        \    },
        \   'paste': {
        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \   },
        \   'cache_enabled': 0,
        \ }
    ]])
    ```

### coc.nvim 配置

- 无特殊说明所有配置项均添加在 `nvim/coc-settings.json` 文件中，可以使用
  `:CocConfig` 来进行配置

1. coc.nvim

    - 补全配置默认不选中第一个补全提示参数: `"suggest.noselect": true`
    - 指定文件类型保存时自动格式化/不格式化: `"[json]": { "coc.preferences.formatonsave": true }`
    - 自动显示当前行的所有诊断信息: `"diagnostic.checkCurrentLine": true`
    - 诊断信息显示优先等级: `"diagnostic.signPriority": 1`

2. coc-sumneko-lua

    - 构造表不显示数组索引: `"Lua.hint.arrayIndex": "Disable"`
    - 关闭内联提示: `"Lua.hint.enable": false`
    - 中文补全提示: `"sumneko-lua.locale": "zh-cn"`

3. coc-snippets

    - 使用 `vscode` 的 `.json` 代码块配置: `snippets.textmateSnippetsRoots": ["~/.config/nvim/snippets"]`
       > <https://github.com/neoclide/coc-snippets/issues/280>
