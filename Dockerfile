FROM maven:3.9.6-eclipse-temurin-17 as builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/bdd-cucumber-sample-*.jar /app/app.jar
RUN mkdir -p /app/cucumber-reports
CMD ["java", "-jar", "/app/app.jar"]
