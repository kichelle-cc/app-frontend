FROM node:14-alpine as react-build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve the app with a lightweight HTTP server
FROM node:14-alpine
WORKDIR /app
COPY --from=0 /app/build .
RUN npm install -g serve
EXPOSE 8080
CMD ["serve", "-p", "8080", "-s", "."]