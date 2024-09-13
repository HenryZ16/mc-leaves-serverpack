# ENV
export MC_PATH="/home/mc"
cd $MC_PATH

# $MC_PATH
# set up the environment
apt-get update

## install python3 & pip3
apt-get install python3 -y
apt-get install python3-pip -y

## install wget
apt-get install wget -y

## install java 21
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
dpkg -i jdk-21_linux-x64_bin.deb
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-21/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-21/bin/javac 1
update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-21/bin/jar 1

## Get the latest version of MCDReforged
pip3 install mcdreforged -i https://pypi.tuna.tsinghua.edu.cn/simple

# $MC_PATH/mcdrserver 
# Create a new server
mkdir $MC_PATH/mcdrserver
cd $MC_PATH/mcdrserver
mcdreforged init

# $MC_PATH/mcdrserver/server 
# Download the "leaves" core of MC version 1.21
export LAUNCHER="leaves-1.21.1.jar"
cd $MC_PATH/mcdrserver/server
wget https://api.leavesmc.org/v2/projects/leaves/versions/1.21.1/builds/57/downloads/$LAUNCHER
java -jar $LAUNCHER nogui --initSettings

# $MC_PATH/mcdrserver/server 
# agree eula
sed -i 's/false/true/g' eula.txt

# $MC_PATH/mcdrserver/server 
# configure the MUA verification
# -javaagent:authlib-injector-1.2.5.jar=https://skin.mualliance.ltd/api/union/yggdrasil
export VERIFICATION_SERVER="https://skin.mualliance.ltd/api/union/yggdrasil"
wget https://authlib-injector.yushi.moe/artifact/53/authlib-injector-1.2.5.jar

# $MC_PATH/mcdrserver/server
# set up the server
cp $MC_PATH/server-icon.png server-icon.png
while IFS= read -r line
do
    if [[ ! $line =~ ^# && $line =~ .*=.* ]]; then
        key=$(echo "$line" | awk -F= '{print $1}')
        value=$(echo "$line" | awk -F= '{print $2}')
        sed -i "s/^$key=.*$/$key=$value/" $MC_PATH/mcdrserver/server/server.properties
    fi
done < $MC_PATH/server.properties

# $MC_PATH/mcdrserver/server/plugins
# get plugins
cd $MC_PATH/mcdrserver/server/plugins

### put your plugin download links here ###

wget https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar
wget https://github.com/SkinsRestorer/SkinsRestorer/releases/download/15.4.2/SkinsRestorer.jar
wget https://hangarcdn.papermc.io/plugins/pop4959/Chunky/versions/1.4.10/PAPER/Chunky-1.4.10.jar
wget https://hangarcdn.papermc.io/plugins/Collagen/Backuper/versions/3.0.1/PAPER/Backuper-3.0.1.jar
wget https://hangarcdn.papermc.io/plugins/kennytv/Maintenance/versions/4.2.1/PAPER/Maintenance-4.2.1.jar

### put your plugin download links here ###

# $MC_PATH/mcdrserver/server
# configure config.yml
cd $MC_PATH/mcdrserver

## generate start_command
export START_COMMAND="java -Xms8192M -Xmx8192M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar -javaagent:authlib-injector-1.2.5.jar=$VERIFICATION_SERVER $LAUNCHER nogui"
sed -i "s|^start_command: .*|start_command: \"$START_COMMAND\"|" config.yml

## configure handler
sed -i "s|^handler: .*|handler: bukkit_handler|" config.yml