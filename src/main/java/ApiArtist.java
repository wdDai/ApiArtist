import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import static io.restassured.RestAssured.given;
import static io.restassured.http.ContentType.JSON;

public class ApiArtist {

    public static ApiTest execute(ApiTest test) {
        Response response = null;
        printTestInfo(test);
        RequestSpecification requestSpc = given().headers(test.headers);
        if (test.parameters != null)
            requestSpc.queryParams(test.parameters);
        if (test.jsonBody != null)
            requestSpc.contentType(JSON).body(test.jsonBody);

        switch (test.httpMethod) {
            case Get:
                response = requestSpc.get(test.url);
                break;

            case Post:
                response = requestSpc.post(test.url);
                break;

            case Put:
                response = requestSpc.put(test.url);
                break;

            case Delete:
                response = requestSpc.delete(test.url);
                break;

            default:
                test.executionStatus = ExecutionStatus.NotRun;
                System.out.println("HttpMethod doesn't match any of existing implemented methods in AA.");
        }

        if (response != null) {
            System.out.println("- Response received.");
            verify(response, test);
            System.out.println("- ExecutionStatus: " + test.executionStatus);
            if (test.executionStatus == ExecutionStatus.Failed)
                System.out.println("- Responded message:\n   " + response.getBody().asString());
        }

        return test;
    }

    private static void printTestInfo(ApiTest test) {
        System.out.println(test.httpMethod + " " + test.url + " - Test id: " + test.id);
    }

    private static void verify(Response response, ApiTest test) {
        test.responseBody = response.getBody().asString();
        test.respCode = Integer.toString(response.getStatusCode());

        if (test.verification.isVerified())
            test.executionStatus = ExecutionStatus.Passed;
        else test.executionStatus = ExecutionStatus.Failed;

        System.out.println("- Response verified.");
    }
}
