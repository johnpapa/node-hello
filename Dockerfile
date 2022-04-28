FROM node:14 AS build
COPY . .
RUN mkdir ./dist
RUN echo "helloworld" > ./dist/index.html

FROM nginxinc/nginx-unprivileged 
COPY --from=build ./dist /usr/share/nginx/html
EXPOSE 80
