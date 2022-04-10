# nginx-multistage-build
docker run -d -p 8080:80 -v $(pwd)/conf:/usr/local/nginx/conf nginx-from-src:1.0
