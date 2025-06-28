package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static org.junit.Assert.assertEquals;

public class MyStepsdefs {
    WebDriver driver;

    @Given("I open Google homepage")
    public void openGoogle() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless", "--no-sandbox", "--disable-dev-shm-usage");  // ✅ Critical for Docker
        driver = new ChromeDriver(options);  // ✅ Use options
        driver.get("https://www.google.com");
    }

    @Then("I verify the title is {string}")
    public void verifyTitle(String expectedTitle) {
        System.out.println("insided verify");
        String actualTitle = driver.getTitle();
        Assert.assertEquals(expectedTitle, actualTitle);
        driver.quit();
    }
}
