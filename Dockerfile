FROM kong:3.0.0-ubuntu
USER root

COPY kong.yml /kong/declarative/kong.yml

RUN luarocks install lua-resty-http

ENV KONG_DATABASE off
ENV KONG_DECLARATIVE_CONFIG=/kong/declarative/kong.yml
ENV KONG_PROXY_ACCESS_LOG /dev/stdout
ENV KONG_ADMIN_ACCESS_LOG /dev/stdout
ENV KONG_PROXY_ERROR_LOG /dev/stderr
ENV KONG_ADMIN_ERROR_LOG /dev/stderr
ENV KONG_UNTRUSTED_LUA on
ENV KONG_PLUGINS bundled,restriction-check

COPY plugins/restriction-check /usr/local/share/lua/5.1/kong/plugins/restriction-check 