# Terraria Server V1.3.3.3
![Terraria Logo](https://hydra-media.cursecdn.com/terraria.gamepedia.com/7/7a/Terraria-official-website-2014.png "Terraria Logo")

## Vanilla Dedicated Linux Server
This docker container is based on the latest debain linux und uses the official dedicated server package from [Terraria.org](http://terraria.org/).

## Volumes
* the path to store the terraria worlds
```
-v "/hostpath/world":"/world":rw
``` 
* using your own server configuration file
```
-v "/hostpath/server.config":"/opt/terraria/Dedicated Server/Linux/server.config":rw
``` 
* get the server log file (this is console ouput)
```
-v "/hostpath/log/terraria/":"/var/log/terraria":rw
``` 

## Start the server
```
docker run -dit --name="Terraria-Server" -p 7777:7777 -v "/srv/terraria/worlds/":"/world":rw -v "/var/log/terraria/":"/var/log/terraria":rw topdockercat/terraria-server-vanilla
```

## Attach to server console
```
docker attach Terraria-Server
```

## Detach from server console
```
crtl+p
```