package runners;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/mysteps",  // Path to your .feature files
        glue = "mysteps",                            // Package containing step definitions
        plugin = {"pretty", "html:target/cucumber-reports.html"}, // Output reports
        monochrome = true                          // Clean console output
)
public class TestRunner {
}
