package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.junit.After;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.File;
import java.util.UUID;

import static org.junit.Assert.assertEquals;

public class MyStepsdefs {
    WebDriver driver;

    @Given("I open Google homepage")
    public void openGoogle() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless", "--no-sandbox", "--disable-dev-shm-usage", "--remote-debugging-port=9222");

        // Use writable user-data-dir inside container
        String userDataDir = "/app/tmp/chrome-profile-" + UUID.randomUUID();
        new File(userDataDir).mkdirs(); // ensure directory exists
        options.addArguments("--user-data-dir=" + userDataDir);

        // Explicitly set Chrome binary location
        options.setBinary("/usr/local/bin/google-chrome");

        driver = new ChromeDriver(options);
        driver.get("https://www.google.com");
    }



    @Then("I verify the title is {string}")
    public void verifyTitle(String expectedTitle) {
        String actualTitle = driver.getTitle();
        Assert.assertEquals(expectedTitle, actualTitle);
    }

    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

}
