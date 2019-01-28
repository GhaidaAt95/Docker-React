# Section 1: Build Phase
FROM node:11-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Section 2:  Run Phase

# The build folder is in /app/build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Default command for nginx is start nginx so we dont have to specifically give a command

