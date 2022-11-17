# Build Stage
FROM node:12.20-alpine AS build
WORKDIR /app
COPY package*.json /app/
RUN npm install 
COPY ./ /app/
RUN node_modules/.bin/ng build --output-path=dist --prod=true



# Run Stage
FROM nginx:1.17.1-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
