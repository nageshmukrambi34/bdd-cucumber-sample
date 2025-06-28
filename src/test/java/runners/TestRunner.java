package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/mysteps",
        glue = {"steps"},
        plugin = {
                "pretty",
                "json:cucumber-reports/cucumber.json",
                "html:cucumber-reports/html-report.html"
        },
        monochrome = true
)
public class TestRunner {}