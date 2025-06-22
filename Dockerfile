# Start from Maven base image
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the project (runs mvn clean install)
RUN mvn clean install

# ---- Run stage ----
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy built jar from previous stage
COPY --from=build /app/target/*.jar app.jar

# Set entrypoint
ENTRYPOINT ["java", "-jar", "app.jar"]
