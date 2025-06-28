FROM maven:3.9.6-eclipse-temurin-17

FROM seleniarm/standalone-chromium:latest


# Add to PATH
ENV PATH="/usr/local/bin:$PATH"

# Set workdir and copy project
WORKDIR /app
COPY . .
# Build the code (only compile; no tests or reports yet)
RUN mvn clean compile
# Run tests with headless browser
CMD ["mvn", "test"]
