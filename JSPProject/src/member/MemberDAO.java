package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class MemberDAO {
	Connection conn; 
	PreparedStatement pstmt;
	ResultSet rs;
	
	/**
	 * 아이디 중복확인
	 * */
	public boolean idCheck(String id) {
		conn = DBUtil.connection();
		String sql = "SELECT COUNT(*) FROM member WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int same_id = rs.getInt(1);
			if (same_id == 1) {
				return false;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * 회원가입
	 * */
	public boolean beMember(String id, String pw, String name, String mail) {
		conn = DBUtil.connection();
		String sql = "insert into member values(?,?,?,?)"; 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setString(4,mail);
			rs = pstmt.executeQuery();
		} catch(SQLException e) {
			e.printStackTrace();
			return false; 
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
