FROM bdcloud/java8-base

MAINTAINER james tang <jamess@126.com>

ENV KAFKA_HOME=/opt/kafka

ENV PATH=${PATH}:${KAFKA_HOME}/bin

ENV KAFKA_VERSION 2.11-2.0.0

ADD kafka_$KAFKA_VERSION.tar /opt
RUN mv /opt/kafka_$KAFKA_VERSION /opt/kafka

COPY ./server.properties /opt/kafka/config/
COPY ./run.sh /usr/bin/
COPY ./create-topics.sh /usr/bin/
COPY ./broker-list.sh /usr/bin/

EXPOSE 9092

CMD ["run.sh"]
