# FROM alpine:3 AS build
# ARG VERSION=2.20
# RUN apk add --no-cache autoconf \
#     automake \
#     gettext \
#     libtool \
#     gawk \
#     pkgconfig \
#     objdump \
#     gcc \
#     make
# RUN wget -O radvd.tar.gz https://github.com/radvd-project/radvd/releases/download/v${VERSION}/radvd-${VERSION}.tar.gz
# RUN tar -xzf radvd.tar.gz --strip-components=1
# RUN ./configure --prefix=/usr/local --sysconfdir=/etc --mandir=/usr/share/man
# RUN ./configure --help && exit 1
FROM alpine:3.22
RUN apk add --no-cache radvd=2.20-r0 && mkdir -p /run/radvd
CMD [ "radvd" ]