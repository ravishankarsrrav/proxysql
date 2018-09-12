FROM ubuntu:16.04
MAINTAINER Ravishankar S R <ravishankarsr.rav@gmail.com>
RUN apt-get update && apt-get install -y wget && \
    mkdir build && cd build && \
    wget https://github.com/sysown/proxysql/releases/download/v1.4.10/proxysql_1.4.10-ubuntu16_amd64.deb && \
    dpkg -i proxysql*.deb && \
    apt-get install -y libssl1.0.0 && \
    apt-get install -y mysql-client && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

ADD proxysql.cnf /etc/proxysql.cnf
COPY proxysql-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

VOLUME /var/lib/proxysql

EXPOSE 3306 6032
CMD [""]
