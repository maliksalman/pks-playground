FROM java
LABEL maintainer="smalik@pivotal.io"

WORKDIR /root/
ADD http://ftp.wayne.edu/apache/kafka/1.0.0/kafka_2.11-1.0.0.tgz /root/
RUN tar xzf *.tgz; rm *.tgz; ln -s $(ls) kafka
				
ADD kafka-server-start.sh /root/
RUN chmod 755 kafka-server-start.sh

EXPOSE 9092
ENTRYPOINT /root/kafka-server-start.sh
