FROM node:15.8.0-alpine3.10 as base

# RUN apk add util-linux
# RUN apk add --no-cache --virtual .build-deps alpine-sdk python
RUN apk add --no-cache netcat-openbsd

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV HUSKY_SKIP_INSTALL=true

COPY package.json package-lock.json ./
RUN npm ci

COPY .babelrc .eslintrc.js .prettierrc jest.config.js nuxt.config.ts \
  tsconfig.json vue-shim.d.ts ./
COPY ./assets ./assets
COPY ./components ./components
COPY ./layouts ./layouts
COPY ./middleware ./middleware
COPY ./pages ./pages
COPY ./plugins ./plugins
COPY ./static ./static
COPY ./store ./store
COPY ./test ./test

FROM base as prod
RUN npm run build

# https://nuxtjs.org/docs/2.x/features/configuration#edit-host-and-port
ENV HOST=0.0.0.0
ENV NODE_ENV=production
CMD ["npm", "start"]
