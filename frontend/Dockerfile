FROM node:alpine as build

# Установка git и других необходимых инструментов
RUN apk add --no-cache git

WORKDIR /app

RUN git clone https://github.com/dabuldakov/world-country-monitoring-front.git

COPY nginx.conf nginx.conf

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring-front

RUN npm install
RUN npm run build

FROM nginx:stable-alpine

# Копируйте скомпилированные файлы из стадии сборки в Nginx
COPY --from=build /app/world-country-monitoring-front/build /usr/share/nginx/html

# Если у вас есть свой файл конфигурации для Nginx, убедитесь что он доступен при сборке
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD [ "nginx", "-g", "daemon off;" ]