FROM eclipse-temurin:17-jre

LABEL app=employee-app

WORKDIR /target

COPY target/*.jar employee-app.jar

EXPOSE 8080

HEALTHCHECK --interval=35s --timeout=4s \
  CMD curl -f http://localhost:8080/ || exit 1

ENTRYPOINT ["java", "-jar", "employee-app.jar"]
