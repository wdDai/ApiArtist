public enum VerificationType {
    VJson,
    VText,
    VDefault;

    public static VerificationType is(String str) {
        if (str == null)
            return VDefault;

        switch (str.toLowerCase()) {
            case "text":
                return VText;
            case "json":
                return VJson;
            default:
                return VDefault;
        }
    }
}
