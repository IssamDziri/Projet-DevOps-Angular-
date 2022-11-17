#stage 1
FROM node:14.21.1 AS node
WORKDIR /app
COPY . .
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/* /usr/share/nginx/html
CMD [ "nginx","-g","daemon off;" ]
EXPOSE 80
