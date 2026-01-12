FROM node:18-alphine as installer
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ..
RUN npm run build
FROM ngnix as deployer
COPY --from=installer /app/build /usr/build/share/nginx/html
