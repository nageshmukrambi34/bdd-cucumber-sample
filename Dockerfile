FROM maven:3.9.6-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Install Chrome + ChromeDriver
RUN apt-get update && apt-get install -y wget gnupg unzip curl && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb && \
    CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+') && \
    MAJOR_VERSION=$(echo $CHROME_VERSION | cut -d '.' -f 1) && \
    CHROMEDRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$MAJOR_VERSION") && \
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Copy your code into the container
COPY . .

# Compile the code
RUN mvn clean compile

# Run the tests
CMD ["mvn", "test"]
