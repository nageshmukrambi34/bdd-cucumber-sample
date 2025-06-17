package steps;

import io.cucumber.java.en.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import static org.junit.Assert.*;

public class MyStepsdefs {
    WebDriver driver;

    @Given("I open Google homepage")
    public void openGoogle() {
        driver = new ChromeDriver();
        driver.get("https://www.google.com");
    }

    @Then("I verify the title is {string}")
    public void verifyTitle(String expectedTitle) {
        String actual = driver.getTitle();
        assertEquals(expectedTitle, actual);
        driver.quit();
    }
}