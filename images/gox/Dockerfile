FROM golang:1.9 AS build

RUN go get github.com/mitchellh/gox
VOLUME /src
WORKDIR /src
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT [ "run.sh" ]]
