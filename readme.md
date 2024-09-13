# MC leaves 服务端构建文件
SHTechCraft四周目自用服务端，预计构建用时4-5分钟。

本服务器使用[MCDReforged](https://mcdreforged.com/zh-CN)管理，并采用[Leaves](https://leavesmc.org/downloads/leaves)核心以取得生电玩法与优化的平衡。

### 如何启动
假设你已经成功启动了镜像。你需要在`/home/mc/mcdrserver`中使用`mcdreforged`命令。你可以使用`pip` (windows) 或 `pip3` (unix-like) 安装。

### 插件
已添加的插件（paper端，与leaves端兼容）：
- Backuper
- Chunky
- Essentials
- Maintenance
- SkinsRestorer

### 你可能需要持久化的文件 & 目录
假设当前目录为MC服务器根目录（"*"表通配符）：
```
authlib-injector.log
auto_update
banned-ips.json
banned-players.json
bukkit.yml
commands.yml
config
help.yml
leaves.yml
logs
ops.json
permissions.yml
plugins/Backuper
plugins/Chunky
plugins/Essentials
plugins/Maintenance
plugins/SkinsRestorer
spigot.yml
usercache.json
version_history.json
whitelist.json
world
world_nether
world_the_end
```
以便你在使用这个镜像重启的时候，你仍然能够保留你的世界数据等重要文件