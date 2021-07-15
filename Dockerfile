FROM golang as build

WORKDIR /app
ADD . /app
RUN go build -ldflags="-w -s"
ENTRYPOINT ./meugo

FROM scratch as prod
COPY --from=build /app/meugo .
ENTRYPOINT ["/meugo"]
