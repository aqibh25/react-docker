# This is the Dockerfile for the production environment
# builder is a name of the stage
FROM node:18-alpine as builder

# WORKDIR is the working directory for the container
WORKDIR '/app' 

# COPY is used to copy the package.json file to the container
COPY package.json .

# RUN is used to run the command in the container
RUN npm install

# COPY is used to copy the rest of the files to the container
COPY . .

# RUN is used to run the command in the container
RUN npm run build

# FROM is used to specify the base image
FROM nginx

# COPY is used to copy the build files to the nginx container
COPY --from=builder /app/build /usr/share/nginx/html

# docker run -p 8080:80 <container_id>
