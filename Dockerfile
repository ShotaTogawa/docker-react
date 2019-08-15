# 1st phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <--- we care about it

# 2nd phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

