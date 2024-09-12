FROM golang:1.19.1-buster as go-target
ADD . /zek
WORKDIR /zek/cmd/zek
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /zek/cmd/zek/zek /
COPY --from=go-target /zek/fixtures/*.xml /testsuite/

ENTRYPOINT []
CMD ["/zek", "@@"]
