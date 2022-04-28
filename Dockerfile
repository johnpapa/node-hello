FROM node:14 AS build
COPY . .
RUN npm --registry https://registry.npm.taobao.org install --unsafe-perm \
    && npm run build
	
FROM docker.io/jdxu/nginx:1.13
COPY --from=build ./dist /usr/share/nginx/html
EXPOSE 80
