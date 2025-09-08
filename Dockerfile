FROM node:16-alpine as builder
WORKDIR '/tmp/prod/frontend'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /tmp/prod/frontend/build /usr/share/nginx/html
