# MC leaves 服务端构建文件
SHTechCraft四周目自用服务端，预计构建用时3-4分钟。

本服务器使用[MCDReforged](https://mcdreforged.com/zh-CN)管理，并采用[Leaves](https://leavesmc.org/downloads/leaves)核心以取得生电玩法与优化的平衡。

### 如何启动
假设你已经成功启动了镜像。你需要在`/home/mc/mcdrserver`中使用`mcdreforged`命令。你可以使用`pip` (windows) 或 `pip3` (unix-like) 安装。

### 插件
已添加的插件:
- MCDReforged:
    - [Prime Backup](https://mcdreforged.com/zh-CN/plugin/prime_backup)
- leaves端（你需要在容器中启动`plugins.sh`以下载这些插件）：
    - [AuxProtect](https://dev.bukkit.org/projects/auxprotect)
    - [CoreProtect](https://hangar.papermc.io/CORE/CoreProtect)
    - [Chunky](https://hangar.papermc.io/pop4959/Chunky)
    - [Essentials](https://hangar.papermc.io/EssentialsX/Essentials)
    - [FreedomChat](https://modrinth.com/plugin/freedomchat)
    - [Maintenance](https://hangar.papermc.io/kennytv/Maintenance)
    - [SkinsRestorer](https://hangar.papermc.io/SRTeam/SkinsRestorer)
    - [ViaVersion](https://hangar.papermc.io/ViaVersion/ViaVersion)
    - [ViaBackwards](https://hangar.papermc.io/ViaVersion/ViaBackwards)
    - [ViaRewind](https://hangar.papermc.io/ViaVersion/ViaRewind)
    - [Vault](https://www.spigotmc.org/resources/vault.34315/)
    - [SimpleVoiceChat](https://hangar.papermc.io/henkelmax/SimpleVoiceChat)

### 你可能需要持久化的文件 & 目录
假设当前目录为MC服务器根目录（"*"表通配符）：
```
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
plugins
spigot.yml
usercache.json
whitelist.json
world
world_nether
world_the_end
```
你还需要持久化`mcdrserver`目录内的：
```
config
config.yml
permission.yml
```
以便你在使用这个镜像重启的时候，你仍然能够保留你的世界数据等重要文件