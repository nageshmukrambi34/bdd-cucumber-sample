FROM maven:3.9.6-eclipse-temurin-17

# Install Chrome
RUN apt-get update && apt-get install -y wget gnupg unzip curl \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb

# Install compatible ChromeDriver (e.g., 124.x)
RUN CHROMEDRIVER_VERSION=124.0.6367.91 \
    && wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/chromedriver \
    && rm /tmp/chromedriver.zip

# Add to PATH
ENV PATH="/usr/local/bin:$PATH"

# Set workdir and copy project
WORKDIR /app
COPY . .
# Build the code (only compile; no tests or reports yet)
RUN mvn clean compile
# Run tests with headless browser
CMD ["mvn", "test"]
