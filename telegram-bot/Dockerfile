#Build stage
FROM gradle:latest AS build

# Установите необходимые инструменты
RUN apt-get update  \
    && apt-get install -y git curl ca-certificates  \
    && update-ca-certificates  \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Клонируйте репозиторий
ARG REPO_URL_V_7=https://github.com/dabuldakov/telegram-bot.git
RUN git clone ${REPO_URL_V_7}

# Установите рабочую директорию
WORKDIR /app/telegram-bot

RUN gradle build

# Запуск конечного образа
FROM openjdk:21-jdk-slim

ENV JAR_NAME=infrastructure.jar
ENV APP_HOME=/app/telegram-bot/infrastructure
WORKDIR $APP_HOME

# Скопируйте скомпилированное приложение из стадии сборки
COPY --from=build $APP_HOME .

# Укажите команду для запуска приложения
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$JAR_NAME
