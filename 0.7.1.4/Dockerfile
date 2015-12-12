FROM debian:jessie

RUN groupadd -r beansdb && useradd -r -g beansdb beansdb
RUN mkdir -p /var/lib/beansdb; \
    mkdir -p /var/log/beansdb; \
    mkdir -p /etc/beansdb;

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    dh-autoreconf \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/douban/beansdb --depth 1 \
    && cd beansdb \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install


ADD beansdb_log.conf /etc/beansdb/beansdb_log.conf
RUN chown beansdb:beansdb -R /var/lib/beansdb \
    && chown beansdb:beansdb -R /etc/beansdb \
    && chown beansdb:beansdb -R /var/log/beansdb

VOLUME /var/lib/beansdb

EXPOSE 7900
CMD ["beansdb", "-u", "beansdb", "-H", "/var/lib/beansdb", "-L", "/etc/beansdb/beansdb_log.conf"]
