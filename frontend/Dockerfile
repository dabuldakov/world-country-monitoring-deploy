FROM node:alpine as build

# Установка git и других необходимых инструментов
RUN apk add --no-cache git

COPY . .

WORKDIR /app

ARG REPO_URL_V_6=https://github.com/dabuldakov/world-country-monitoring-front.git
RUN git clone ${REPO_URL_V_6}

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring-front

RUN npm install
RUN npm run build

FROM nginx:stable-alpine

# Копируйте скомпилированные файлы из стадии сборки в Nginx
ENV APP_HOME=/app/world-country-monitoring-front
COPY --from=build $APP_HOME/build /usr/share/nginx/html

# Если у вас есть свой файл конфигурации для Nginx, убедитесь что он доступен при сборке
COPY --from=build nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD [ "nginx", "-g", "daemon off;" ]