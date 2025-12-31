FROM eclipse-temurin:17-jre
LABEL app=employee-app
COPY ./target/*.jar /target/employee-app.jar
WORKDIR /target
HEALTHCHECK --interval=35s --timeout=4s CMD curl -f https://localhost/ || exit 1
ENTRYPOINT ["java", "-jar", "employee-app.jar"]

