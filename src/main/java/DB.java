public class DB {
    public String name;
    public String ip;
    public String port;
    public String userName;
    public String password;
    public DB(String ip, String port, String name, String userName, String password){
        this.ip = ip;
        this.port = port;
        this.name = name;
        this.userName = userName;
        this.password = password;
    }
}
