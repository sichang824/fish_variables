# Fish 变量管理工具

这个 Fisher 插件用于检查和修复 Fish shell 配置变量，特别是那些容易出现重复定义的变量。

## 功能

- 检查变量是否存在重复定义
- 检查变量值是否与预期相符
- 修复变量问题（删除重复定义并设置正确值）
- 列出所有重复定义的变量
- 导出推荐配置到文件

## 安装

使用 Fisher 安装：

```fish
fisher install username/fish_variables
```

## 使用方法

### 检查单个变量

```fish
# 检查单个变量
fish_vars check fish_history_save_on_command true
```

### 使用配置文件检查多个变量

```fish
# 首先导出配置模板
fish_vars export ~/my_vars.conf

# 编辑配置文件
vim ~/my_vars.conf

# 使用配置文件检查变量
fish_vars check --file ~/my_vars.conf
```

### 修复变量

```fish
# 修复单个变量
fish_vars fix sponge_purge_only_on_exit true

# 使用配置文件修复多个变量
fish_vars fix --file ~/my_vars.conf
```

### 查找重复定义的变量

```fish
# 列出所有重复定义的变量
fish_vars list
```

### 获取帮助

```fish
fish_vars help
```

## 配置文件格式

配置文件使用简单的文本格式，每行一个变量定义：

```
# 这是注释
变量名 值
```

例如：

```
# Fish 历史记录设置
fish_history_save_on_command true
fish_history_ignore_failures false

# Sponge 插件设置
sponge_purge_only_on_exit true
sponge_filters sponge_filter_failed sponge_filter_matched
```

## 常见问题解决

### 修复重复定义的变量

出现重复定义的变量通常是因为多次使用 `set -U` 命令设置同一个变量。使用 `fish_vars list` 找出这些变量，然后使用 `fish_vars fix` 命令修复：

```fish
fish_vars fix 变量名 值
```

### 使用推荐配置

可以使用 `export` 命令导出推荐配置，然后根据需要修改：

```fish
fish_vars export ~/.config/fish/recommended_vars.conf
```

## 自定义

您可以根据需要添加更多变量到配置文件中，或直接使用命令行参数：

```fish
fish_vars check 自定义变量名 期望值
```