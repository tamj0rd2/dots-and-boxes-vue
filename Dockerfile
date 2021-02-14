FROM node:15.8.0-alpine3.10 as base

RUN apk add --no-cache --virtual .build-deps alpine-sdk python netcat-openbsd util-linux

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV HUSKY_SKIP_INSTALL=true

COPY package.json package-lock.json ./
RUN npm ci

COPY .babelrc .eslintrc.js .prettierrc jest.config.js nuxt.config.ts \
  tsconfig.json vue-shim.d.ts ./
COPY ./src ./src

FROM base as prod
RUN npm run build

# https://nuxtjs.org/docs/2.x/features/configuration#edit-host-and-port
ENV HOST=0.0.0.0
ENV NODE_ENV=production
CMD ["npm", "start"]
