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

# In a dev enviroment, in most env. the expose instruction is really 
# supposed to be communication to me as a developer
# This is sth I read inside of a docker file and understand 
# that this containe probably needs to get a port mapped to port 80
# so by default on our machines this instruction does nothing 
# But with AWS Elastic Beanstalk 
# It looks for the expose instruction and whatever port is listed 
# it is going to map directly automatically 
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

# Default command for nginx is start nginx so we dont have to specifically give a command

