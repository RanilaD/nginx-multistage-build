FROM debian:9
RUN apt update && apt install -y make gcc wget libpcre3-dev zlib1g-dev
RUN wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
  tar xzf nginx-1.20.2.tar.gz && cd nginx-1.20.2 && \
  ./configure && make && make install


FROM debian:9
WORKDIR /usr/local/nginx/sbin
COPY --from=0 /usr/local/nginx/sbin/nginx .
RUN chmod +x nginx && mkdir ../conf ../logs && touch ../logs/error.log
CMD ["./nginx", "-g", "daemon off;"]
