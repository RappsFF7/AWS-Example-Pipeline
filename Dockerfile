# we'll use Node 16 since that was what we have in our .elasticbeanstalk/config.yml file
FROM node:16
# where our app will be located in the docker image
RUN mkdir -p /app
WORKDIR /app
# move all source code
COPY . .
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 8080