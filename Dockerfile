FROM node:alpine 
WORKDIR '/app'

COPY package.json .
RUN npm install 

COPY . . 
RUN npm run build 

FROM nginx 
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html
# The nginx container runs itself on start, do not need a run command. 
# expose 80 tells beanstalk to map trafic to port 80.   