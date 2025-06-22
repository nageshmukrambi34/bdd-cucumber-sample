package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/mysteps",
        glue = {"steps"},
        plugin = {"html:/app/reports/cucumber.html", "summary"},
        monochrome = true
)
public class TestRunner {}
