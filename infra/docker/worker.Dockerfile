# syntax=docker/dockerfile:1.4
FROM rust:1.76-slim as builder

WORKDIR /usr/src/aether
COPY . .

RUN cargo build --release --bin aether-worker

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/aether/target/release/aether-worker /usr/local/bin/aether-worker

ENV RUST_LOG=info
EXPOSE 8081
CMD ["aether-worker"]
