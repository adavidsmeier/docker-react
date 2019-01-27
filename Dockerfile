#Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#Run Phase
FROM nginx
#/app/build <- all the stuff we need
COPY --from=builder /app/build /usr/share/nginx/html
