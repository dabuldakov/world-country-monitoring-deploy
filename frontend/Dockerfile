FROM node:alpine as build

# Установка git и других необходимых инструментов
RUN apk add --no-cache git

WORKDIR /app

ARG REPO_URL_V_23=https://github.com/dabuldakov/world-country-monitoring-front.git
RUN git clone ${REPO_URL_V_23}

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring-front

RUN npm install
RUN REACT_APP_API_URL=/api npm run build

FROM nginx:stable-alpine

# Копируйте скомпилированные файлы из стадии сборки в Nginx
ENV APP_HOME=/app/world-country-monitoring-front
COPY --from=build $APP_HOME/build /usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]