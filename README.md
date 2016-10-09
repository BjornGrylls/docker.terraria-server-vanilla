# Terraria Server V1.3.3.3

## Vanilla Dedicated Server

## Usage

docker run -dit --name="Terraria-Server" --net="bridge" -p 7777:7777 -v "/host/path/to/worlds/":"/world":rw -v "/host/path/to/server.config":"/opt/terraria/Dedicated Server/Linux/server.config":rw -v "/host/path/to/log/terraria/":"/var/log/terraria":rw topdockercat/terraria-server-vanilla