package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection connection() {
		Connection conn = null;

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/jsp_project_db?useUnicode=true&characterEncoding=utf8";
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "1234");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
