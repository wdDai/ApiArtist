abstract public class VerificationImpl implements ResponseVerification {
    ApiTest test;

    public VerificationImpl() {
    }

    protected boolean codeIsVerified(ApiTest test) {

        return test.expectedCode.equals(test.respCode);
    }
}
