FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/builder   <-- all the stuff

FROM nginx
EXPOSE 80
#Copying output of Ist phase
COPY --from=builder /app/build /usr/share/nginx/html