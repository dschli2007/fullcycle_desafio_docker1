FROM golang:1.20.1 as build
WORKDIR /app
COPY . .
RUN go build hello-world.go

FROM scratch as prod
WORKDIR /app
COPY --from=build /app/hello-world ./hello-world
CMD ["./hello-world"]