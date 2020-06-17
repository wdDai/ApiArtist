import com.jayway.jsonpath.JsonPath;

public class Verification_json extends VerificationImpl {
    public Verification_json(ApiTest test) {
        this.test = test;
    }

    public boolean isVerified() {
        String respJsonPath = JsonPath.read(test.v_value, "$.respPath");
        String inputJsonPath = JsonPath.read(test.v_value, "$.inputPath");
        String respValue = JsonPath.read(test.responseBody, respJsonPath);
        String expectedValue = JsonPath.read(test.jsonBody, inputJsonPath);
        System.out.println(
                "   Expected code: " + test.expectedCode
                        + "\n   Response code: " + test.respCode
                        + "\n   Expected Value: " + respValue
                        + "\n   Response Value: " + expectedValue);

        return codeIsVerified(test) && respValue.equals(expectedValue) ;
    }
}
