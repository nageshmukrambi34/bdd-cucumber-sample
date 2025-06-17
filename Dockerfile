FROM maven:3.9-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Optional: Build the project during image build (can be removed if you want faster builds)
# RUN mvn clean install

# Command to run tests when the container starts
CMD ["mvn", "clean", "install"]
