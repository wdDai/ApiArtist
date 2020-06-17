import org.testng.annotations.BeforeTest;

import java.sql.SQLException;

public class TestBase {
    protected static Environment env;
    protected static TestUtils utils = new TestUtils();
    protected static String token;

    @BeforeTest
    public void setUp() throws SQLException {
        EnvSettingEntrance entr = new EnvSettingEntrance(
                "localhost",
                "3306",
                "ApiArtistSample",
                "root",
                "123456");

        env = new Environment(entr, "3", "local test data, remote backend");
    }
}
