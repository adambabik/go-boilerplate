FROM alpine:edge
MAINTAINER Adam Babik <a.babik@designfortress.com>

ARG binary_name
ENV _BINARY_NAME=${binary_name}

RUN apk add --no-cache bash ca-certificates

COPY build/${binary_name}_linux-amd64 /usr/local/bin/${binary_name}

CMD ${_BINARY_NAME}
