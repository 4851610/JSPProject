package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<Review> list = new ArrayList<Review>();
	String sql;

	public ArrayList<Review> list() {
		conn = DBUtil.connection();
		sql = "";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}
}
