import java.sql.SQLException;
import java.util.Map;

public class Environment {
    public String BaseUrl;
    public DB testDB;
    public DB backEndDB;

    public Environment(EnvSettingEntrance entr, String env_id) throws SQLException {
        String sql = "Select * From EnvironmentSettings Where id = '" + env_id + "';";
        setEnv(entr, sql);
    }

    public Environment(EnvSettingEntrance entr, String env_id, String note) throws SQLException {
        String sql = "Select * From EnvironmentSettings Where id = '" + env_id + "' " +
                "AND note LIKE '%" + note + "%';";
        setEnv(entr, sql);
    }

    private void setEnv(EnvSettingEntrance entr, String sql) throws SQLException {
        //read environment setting
        Map<String, String> env = AAUtils.readDB(entr.ip, entr.port, entr.dbName, entr.userName, entr.password, sql).get(0);
        String tDB_id = env.get("testDataDB_id");
        String bDB_id = env.get("backEndData_id");

        //read testCase database setting
        sql = "Select * From DBSettings Where id = '" + tDB_id + "';";
        Map<String, String> tSetting = AAUtils.readDB(entr.ip, entr.port, entr.dbName, entr.userName, entr.password, sql).get(0);

        //read backend database setting
        sql = "Select * From DBSettings Where id = '" + bDB_id + "';";
        Map<String, String> bSetting = AAUtils.readDB(entr.ip, entr.port, entr.dbName, entr.userName, entr.password, sql).get(0);

        BaseUrl = env.get("api_base_url");
        testDB = new DB(
                tSetting.get("ip"),
                tSetting.get("port"),
                tSetting.get("name"),
                tSetting.get("username"),
                tSetting.get("password")
        );
        backEndDB = new DB(
                bSetting.get("ip"),
                bSetting.get("port"),
                bSetting.get("name"),
                bSetting.get("username"),
                bSetting.get("password")
        );
        System.out.println("Environment set successfully:" +
                "\n   BaseUrl: " + BaseUrl +
                "\n   TestDB: " + testDB.ip + ":"+testDB.port+"/"+testDB.name+
                "\n   BackEndDB: " + backEndDB.ip +":"+backEndDB.port+"/"+backEndDB.name);
    }
}
