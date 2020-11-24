FROM node:alpine 
WORKDIR '/app'

COPY package.json .
RUN npm install 

COPY . . 
RUN npm run build 

FROM nginx 
COPY --from=0 /app/build /usr/share/nginx/html
# The nginx container runs itself on start, do not need a run command. 