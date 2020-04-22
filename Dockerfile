FROM windows-rust

RUN mkdir C:\proj
WORKDIR C:/proj

COPY Cargo.toml .
COPY Cargo.lock .
COPY src src

# RUN rustup run stable-i686-pc-windows-msvc cargo build --release
RUN cargo build --release

