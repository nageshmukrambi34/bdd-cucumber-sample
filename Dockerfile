FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app
COPY . .

# Build the code (only compile; no tests or reports yet)
RUN mvn clean compile

# Run tests and generate reports when container runs
CMD ["mvn", "test", "verify"]
