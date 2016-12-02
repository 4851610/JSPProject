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
	String sql;

	/**
	 * 아이디 중복확인
	 */
	public boolean idCheck(String userId) {
		conn = DBUtil.connection();
		sql = "SELECT COUNT(*) FROM member WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			int same_id = rs.getInt(1);
			if (same_id == 1) {
				return false;
			}
		} catch (SQLException e) {
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
	 */
	public boolean beMember(String userId, String userPw, String userName, String userMail) {
		conn = DBUtil.connection();
		sql = "insert into member values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userMail);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
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
	 * 로그인
	 */
	public boolean login(String userId, String userPw) {
		conn = DBUtil.connection();
		sql = "";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getString(1).equals(userPw)) {
				result = true;
			}
		} catch (SQLException e) {
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
		return result;
	}
	
	/**
	 * 회원탈퇴
	 * */
	
}
