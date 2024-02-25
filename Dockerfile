# build react
FROM node:18 as build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

# Path: Dockerfile

# build nginx

FROM nginx:1.21.3

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]