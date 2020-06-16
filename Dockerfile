FROM debian

MAINTAINER TopCat <topmailcat@googlemail.com>

RUN apt-get update && apt-get install -y zip wget && apt-get clean 

ENV SERVER_VERSION=1405 \
  SERVER_ROOT=/opt/terraria \
  LOG_ROOT=/var/log/terraria \
  SERVER_ZIP=$SERVER_ROOT/terraria-server.zip

RUN mkdir -p $SERVER_ROOT \
  && wget -q https://www.terraria.org/system/dedicated_servers/archives/000/000/039/original/terraria-server-$SERVER_VERSION.zip -O $SERVER_ZIP \
  && mkdir -p $LOG_ROOT \
  && unzip $SERVER_ZIP $SERVER_VERSION/Linux/* -d $SERVER_ROOT \ 
  && rm $SERVER_ZIP \
  && cd $SERVER_ROOT/$SERVER_VERSION/Linux/ \
  && chmod a+rw * \
  && chmod a+x TerrariaServer*

VOLUME ["/world"]
EXPOSE 7777

WORKDIR $SERVER_ROOT/$SERVER_VERSION/Linux
ADD server.conf .
ADD run.sh .

RUN chmod a+x run.sh

ENTRYPOINT ["./run.sh"]
