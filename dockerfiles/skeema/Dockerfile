FROM alpine:3.19

COPY db_scheme /db_scheme

COPY db_data /db_data

WORKDIR /db_scheme

RUN apk add --no-cache bash mysql-client mariadb-connector-c curl

# INSTALL SKEEMA
ADD https://github.com/skeema/skeema/releases/download/v1.11.2/skeema_1.11.2_linux_amd64.tar.gz .
RUN tar -C /usr/local/bin/ -xf skeema_1.11.2_linux_amd64.tar.gz && rm skeema_1.11.2_linux_amd64.tar.gz
