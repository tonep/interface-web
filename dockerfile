# IMAGE - BASE
FROM node:carbon as build
WORKDIR /docker
COPY . .
RUN npm install -g @angular/cli@6.0.7
RUN npm install
RUN npm run build

FROM nginx:1.14 as deploy
WORKDIR /www
COPY --from=build /docker/dist /var/nginx/html
EXPOSE 80
