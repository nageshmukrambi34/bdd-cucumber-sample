package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/mysteps",
        glue = {"steps"},
        plugin = {
                "pretty",
                "html:cucumber-reports/html-report.html",
                "json:cucumber-reports/cucumber.json"
        },
        monochrome = true
)
public class TestRunner {}
