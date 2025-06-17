# Use official Maven + JDK 17 base image
FROM maven:3.9.6-eclipse-temurin-17

# Set working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the project (compiles code, runs unit tests, downloads dependencies)
RUN mvn clean install

# Default command: run BDD tests
CMD ["mvn", "test"]
