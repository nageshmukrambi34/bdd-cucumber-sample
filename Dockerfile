FROM maven:3.9.6-eclipse-temurin-17
WORKDIR /app
COPY . .
RUN mvn clean install  # Just build during image creation
CMD ["mvn", "test", "verify"]
# Actually run tests and generate reports at runtime
