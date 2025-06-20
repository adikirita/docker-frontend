# Base image used
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
