# Используйте базовый образ с OpenJDK 21
FROM openjdk:21-jdk-slim AS build
# FROM nicb-registry.gts.rus.socgen/nicb/alpine-openjdk-21-gcompat:5 AS build

# Установите необходимые инструменты
RUN apt-get update  \
    && apt-get install -y git curl ca-certificates  \
    && update-ca-certificates  \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Клонируйте репозиторий
RUN git clone https://github.com/dabuldakov/world-country-monitoring.git

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring

# Сделайте Gradle исполняемым
RUN chmod +x gradlew

# Соберите приложение
RUN ./gradlew build --no-daemon

# Запуск конечного образа
FROM openjdk:21-jdk-slim
#FROM nicb-registry.gts.rus.socgen/nicb/alpine-openjdk-21-gcompat:5

# Установите рабочую директорию
WORKDIR /app/world-country-monitoring

# Скопируйте скомпилированное приложение из стадии сборки
# COPY /infrastructure/build/libs/infrastructure.jar world-country-monitoring.jar
# COPY /build/libs/world-country-monitoring.jar app.jar
COPY --from=build /build/libs/world-country-monitoring.jar app.jar

# Укажите команду для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]
