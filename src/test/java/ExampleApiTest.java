import org.json.simple.parser.ParseException;
import org.testng.annotations.BeforeGroups;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.sql.SQLException;
import java.util.Map;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

public class ExampleApiTest extends TestBase {

    @BeforeGroups(groups = {"requests logging in"})
    private void login(){
        utils.login();
    }

    @DataProvider(name = "Test Cases")
    private Object[] getTestCases() throws SQLException {
        String sql = "SELECT * FROM TestCases Where path LIKE '%/JobSeeker%';";
        return AAUtils.readDB(env.testDB, sql).toArray();
    }

    @Test(dataProvider = "Test Cases", groups = "requests logging in")
    public void testJobSeeker(Map<String, String> testCase) throws ParseException {
        ApiTest test = new ApiTest(env, testCase, token);

        switch (testCase.get("path")) {
            case "/JobSeeker/AddFavoriteJob":
                //Todo deleted already added favorite job id from favorite job list
                //Todo assert data exist in database
                break;
            case "/JobSeeker/ListFavoriteJobs":
                //Todo add favorite job id to favorite job list
                break;
            case "/JobSeeker/SearchJobs":
                //Todo add job(s) with keywords
                break;
            case "/JobSeeker/RemoveFavoriteJob":
                //Todo add favorite job id to favorite job list
            case "/JobSeeker/ApplyJob":
                //Todo upload CV, Cover Letter, get job id to apply

                //Todo clearData();
            default:
                break;
        }

        assertThat(ApiArtist.execute(test).executionStatus, is(ExecutionStatus.Passed));
    }
}