import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class AAUtils {
    public static ArrayList<HashMap<String, String>> readDB(
            String ip,
            String port,
            String dbName,
            String userName,
            String password,
            String sql) throws SQLException {

        ResultSet resultSet;
        ResultSetMetaData resultSetMetaData;
        ArrayList<HashMap<String, String>> data = new ArrayList<>();

        String url = String.format("jdbc:mysql://%s:%s/%s", ip, port, dbName);
        Connection conn = DriverManager.getConnection(url, userName, password);
        Statement createStatement = conn.createStatement();

        resultSet = createStatement.executeQuery(sql);
        resultSetMetaData = resultSet.getMetaData();

        while (resultSet.next()) {
            HashMap<String, String> rowData = new HashMap<>();
            for (int i = 1; i <= resultSetMetaData.getColumnCount(); i++) {
                rowData.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
            }
            data.add(rowData);
        }
        return data;
    }

    public static ArrayList<HashMap<String, String>> readDB(DB db, String sql) throws SQLException {
        String ip = db.ip;
        String port = db.port;
        String name = db.name;
        String userName = db.userName;
        String password = db.password;
        return readDB(ip, port, name, userName, password, sql);
    }
}
