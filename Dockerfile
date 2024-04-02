FROM harbor.cloud.netease.com/qztest/skiff-golang-1.19-multi:202310121848 AS builder
WORKDIR /app
ADD . .
RUN go build -o hello .

FROM harbor.cloud.netease.com/qztest/skiff-golang-1.19-multi:202310121848
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]

