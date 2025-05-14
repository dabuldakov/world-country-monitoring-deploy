FROM node:alpine as build

# Установка git и других необходимых инструментов
RUN apk add --no-cache git

WORKDIR /app

ARG REPO_URL_V_10=https://github.com/dabuldakov/world-country-monitoring-front.git
RUN git clone ${REPO_URL_V_10}

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring-front

ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=$REACT_APP_API_URL

RUN npm install
RUN npm run build

FROM nginx:stable-alpine

# Копируйте скомпилированные файлы из стадии сборки в Nginx
ENV APP_HOME=/app/world-country-monitoring-front
COPY --from=build $APP_HOME/build /usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]