FROM maven:3.9.6-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Install Chrome + ChromeDriver
# Install dependencies, Google Chrome (v124.0.6367.91), and matching ChromeDriver
RUN apt-get update && \
    apt-get install -y wget unzip curl gnupg libnss3 libgconf-2-4 libxi6 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxrandr2 libxss1 libasound2 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdbus-1-3 libxshmfence1 && \
    wget https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_124.0.6367.91-1_amd64.deb && \
    apt-get install -y ./google-chrome-stable_124.0.6367.91-1_amd64.deb && \
    rm google-chrome-stable_124.0.6367.91-1_amd64.deb && \
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/124.0.6367.91/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Copy your code into the container
COPY . .

# Compile the code
RUN mvn clean compile

# Run the tests
CMD ["mvn", "test"]