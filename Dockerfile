FROM debian

MAINTAINER TopCat <topmailcat@googlemail.com>

RUN apt-get update && apt-get install -y zip wget && apt-get clean 

ENV SERVER_VERSION=1353 \
  SERVER_ROOT=/opt/terraria \
  LOG_ROOT=/var/log/terraria \
  SERVER_ZIP=$SERVER_ROOT/terraria-server.zip

RUN wget -q http://terraria.org/server/terraria-server-$SERVER_VERSION.zip -O $SERVER_ZIP \
  && mkdir -p $SERVER_ROOT \
  && mkdir -p $LOG_ROOT \
  && unzip $SERVER_ZIP 'Dedicated\ Server/Linux/*' -d $SERVER_ROOT \ 
  && rm $SERVER_ZIP \
  && cd $SERVER_ROOT/Dedicated\ Server/Linux/ \
  && chmod a+rw * \
  && chmod a+x TerrariaServer*

VOLUME ["/world"]
EXPOSE 7777

WORKDIR $SERVER_ROOT/Dedicated\ Server/Linux
ADD server.conf .
ADD run.sh .

RUN chmod a+x run.sh

ENTRYPOINT ["./run.sh"]
