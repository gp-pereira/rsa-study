FROM hexpm/elixir:1.13.4-erlang-24.3.4-alpine-3.14.5

RUN apk upgrade --update-cache --available && \
    apk add openssl curl vim wget git make 

WORKDIR /rsa
COPY . .

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new 1.5.7 && \
    mix deps.get && \
    mix do deps.compile, compile
