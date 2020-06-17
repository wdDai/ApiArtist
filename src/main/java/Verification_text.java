public class Verification_text extends VerificationImpl {
    public Verification_text(ApiTest test) {
        this.test = test;
    }

    public boolean isVerified() {
        System.out.println(
                "   Expected code: " + test.expectedCode
                        + "\n   Response code: " + test.respCode
                        + "\n   Expected text: " + "\"" + test.v_value + "\"");

        return codeIsVerified(test) && test.responseBody.contains(test.v_value);
    }
}
