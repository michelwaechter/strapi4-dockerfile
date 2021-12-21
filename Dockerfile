FROM node:16.13-alpine

RUN mkdir -p /srv/app

WORKDIR /srv/app

COPY package.json .

COPY yarn.lock .

RUN yarn install 

# For docker composer to work:
# RUN apk add curl && curl -OL https://raw.githubusercontent.com/mrako/wait-for/master/wait-for && chmod +x wait-for

COPY . .

RUN yarn run build

# expose 1337 on container
EXPOSE 1337

# start the app
CMD ["yarn", "develop"]
