public enum  HttpMethod {
    Get,
    Post,
    Put,
    Delete;

    public static HttpMethod is(String str){
        switch (str.toLowerCase()){
            case "get":
                return Get;
            case "post":
                return Post;
            case "put":
                return Put;
            case "delete":
                return Delete;
            default:
                return null;
        }
    }
}
