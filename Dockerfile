FROM maven:3.9.6-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Install Chrome + ChromeDriver
RUN apt-get update && apt-get install -y wget unzip curl gnupg \
    libnss3 libgconf-2-4 libxi6 libxcb1 libxcomposite1 libxcursor1 \
    libxdamage1 libxrandr2 libxss1 libasound2 libatk1.0-0 libatk-bridge2.0-0 \
    libcups2 libdbus-1-3 libxshmfence1 && \
    # Download Chrome for Testing 138
    wget -q https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.49/linux64/chrome-linux64.zip && \
    unzip chrome-linux64.zip -d /usr/local && \
    mv /usr/local/headless-shell-linux64/google-chrome /usr/local/bin/google-chrome && \
    rm chrome-linux64.zip && \
    # Download matching ChromeDriver 138
    wget -q https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.49/linux64/chromedriver-linux64.zip && \
    unzip chromedriver-linux64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm chromedriver-linux64.zip

# Copy your code into the container
COPY . .

# Compile the code
RUN mvn clean compile

# Run the tests
CMD ["mvn", "test"]