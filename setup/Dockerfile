FROM alpine:3.15.3

RUN apk add --no-cache netcat-openbsd curl

ADD https://raw.githubusercontent.com/eficode/wait-for/v2.2.3/wait-for .

COPY *.sh .

ENTRYPOINT ["sh", "entrypoint.sh"]
