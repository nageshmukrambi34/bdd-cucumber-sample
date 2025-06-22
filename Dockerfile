FROM maven:3.9.3-eclipse-temurin-17 as builder

WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app /app

RUN mkdir -p /app/reports

CMD ["mvn", "test", "-Dcucumber.options=--plugin html:/app/reports/cucumber.html"]
