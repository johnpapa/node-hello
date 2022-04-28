FROM node:14 AS build
COPY . .
RUN mkdir ./dist
RUN cat "helloworld" > ./dist/index.html

FROM docker.io/jdxu/nginx:1.13
COPY --from=build ./dist /usr/share/nginx/html
EXPOSE 80
