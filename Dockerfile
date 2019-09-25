FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# /app/builder   <-- all the stuff

FROM nginx

#Copying output of Ist phase
COPY --from=builder /app/build /usr/share/nginx/html