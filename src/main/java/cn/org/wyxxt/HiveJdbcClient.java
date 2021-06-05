package cn.org.wyxxt;

import java.sql.*;

/**
 * @author xingzhiwei
 * @createBy IntelliJ IDEA
 * @time 2021/6/5 下午4:07
 * @email jsjxzw@163.com
 */


public class HiveJdbcClient {

    private static String driverName = "org.apache.hive.jdbc.HiveDriver";

    public static void main(String[] args) throws SQLException {
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = DriverManager.getConnection("jdbc:hive2://node01:10000/default", "root", "123456");
        Statement stmt = conn.createStatement();
        String sql = "select * from psn2 limit 5";
        ResultSet res = stmt.executeQuery(sql);
        while (res.next()) {
            System.out.println(res.getString(1) + "-" + res.getString("name"));
        }
    }
}
