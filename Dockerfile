# ---------- Build stage ----------
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:17-jre

LABEL app=employee-app

WORKDIR /target

COPY --from=build /app/target/*.jar employee-app.jar

EXPOSE 9080

HEALTHCHECK --interval=35s --timeout=4s \
  CMD curl -f http://localhost:9080/ || exit 1

ENTRYPOINT ["java", "-jar", "employee-app.jar"]
