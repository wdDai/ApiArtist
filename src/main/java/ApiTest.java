import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ApiTest {
    public String id;
    public String team;
    public String url;
    public HttpMethod httpMethod;
    public String jsonBody;
    public HashMap<String, String> parameters;
    public HashMap<String, String> headers = new HashMap<>();
    public List<String> responseHeaders;
    public ResponseVerification verification;
    public ExecutionStatus executionStatus;
    protected String v_value;
    protected String expectedCode;
    protected String respCode;
    protected String responseBody;

    public ApiTest(Environment env, Map<String, String> testCase) throws ParseException {
        extractTestData(env, testCase);
    }

    public ApiTest(Environment env, Map<String, String> testCase, String token) throws ParseException {
        extractTestData(env, testCase);
        headers.put("Authorization", "Bearer " + token);
    }

    private void extractTestData(Environment env, Map<String, String> testCase) throws ParseException {
        id = testCase.get("id");
        url = env.BaseUrl + testCase.get("path");
        httpMethod = HttpMethod.is(testCase.get("httpMethod"));
        expectedCode = testCase.get("expectedCode");
        jsonBody = testCase.get("jsonBody");
        v_value = testCase.get("v_value");
        parameters = readJson(testCase.get("param"));
        switch (verificationTypeIs(testCase)) {
            case VText:
                verification = new Verification_text(this);
                break;
            case VJson:
                verification = new Verification_json(this);
                break;
            default:
                verification = new Verification_default(this);
                break;
        }
    }

    private HashMap<String, String> readJson(String jsonString) throws ParseException {
        if (jsonString == null)
            return null;

        HashMap<String, String> param = new HashMap<>();
        JSONParser jsonParser = new JSONParser();
        JSONObject json = (JSONObject) jsonParser.parse(jsonString);

        for (Object o : json.keySet()) {
            String key = (String) o;
            param.put(key, (String) json.get(key));
        }
        return param;
    }

    private VerificationType verificationTypeIs(Map<String, String> testCase) {
        return VerificationType.is(testCase.get("v_type"));
    }
}
