FROM node:18.17.1-alpine as react-build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
ENV PORT=8080
EXPOSE 8080
RUN npm run build

FROM nginx:alpine
# COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]