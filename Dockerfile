###########
# builder #
###########

FROM golang:1.24-bullseye AS builder
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    upx-ucl

WORKDIR /build
COPY . .

RUN GO111MODULE=on CGO_ENABLED=0 go build -o ./bin/goskel \
    -ldflags='-w -s -extldflags "-static"' \
    . \
 && upx-ucl --best --ultra-brute ./bin/goskel

###########
# release #
###########

FROM gcr.io/distroless/static-debian11:latest AS release

COPY --from=builder /build/bin/goskel /bin/
WORKDIR /workdir
ENTRYPOINT ["/bin/goskel"]
