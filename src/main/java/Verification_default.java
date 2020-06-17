public class Verification_default extends VerificationImpl {
    public Verification_default(ApiTest test) {
        this.test = test;
    }

    public boolean isVerified() {
        System.out.println("   Expected code: " + test.expectedCode + "\n   Response code: " + test.respCode);

        return codeIsVerified(test);
    }
}
