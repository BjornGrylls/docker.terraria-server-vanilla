# Terraria Server V1.4.1.2

![Terraria Logo](https://static.wikia.nocookie.net/terraria_gamepedia/images/7/7a/Terraria-official-website-2014.png/revision/latest "Terraria Logo")

## Vanilla Dedicated Linux Server

This docker container is based on the latest debain linux und uses the official dedicated server package from [Terraria.org](https://terraria.gamepedia.com/Server).

## Volumes

* the path to store the terraria worlds

```shell
-v "/hostpath/world":"/world":rw
```

* using your own server configuration file

```shell
-v "/hostpath/server.config":"/opt/terraria/Dedicated Server/Linux/server.config":rw
```

* get the server log file (this is console ouput)

```shell
-v "/hostpath/log/terraria/":"/var/log/terraria":rw
```

## Build the image

```shell
docker build --tag terraria-server-vanilla:latest .
```

## Create the container

~~docker run -dit --name="Terraria-Server" -p 7777:7777 -v "/srv/terraria/worlds/":"/world":rw -v "/var/log/terraria/":"/var/log/terraria":rw topdockercat/terraria-server-vanilla~~

I had to use this command:

```shell
docker create --publish 7777:7777 -it --name terraria terraria-server-vanilla -v "/srv/terraria/worlds/":"/world":rw -v "/var/log/terraria/":"/var/log/terraria":rw
```

Or you can create and start like this:

```shell
docker run --publish 7777:7777 -itd --name terraria terraria-server-vanilla -v "/srv/terraria/worlds/":"/world":rw -v "/var/log/terraria/":"/var/log/terraria":rw
```

## Start the container

```shell
docker start terraria
```

## Attach to container console

```shell
docker attach terraria
```

## Detach from container console

```command
crtl+p crtl+q
```

## Stop the container

```shell
docker stop terraria
```
