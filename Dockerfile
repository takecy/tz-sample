# This image is simple, but too big.

FROM golang:1.9.1-alpine

COPY . $GOPATH/src/github.com/takecy/tz
WORKDIR $GOPATH/src/github.com/takecy/tz

RUN go build -o tz .\
 && mv tz /usr/local/bin/

CMD ["tz"]