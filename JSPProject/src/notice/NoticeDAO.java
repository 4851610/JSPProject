package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class NoticeDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<Notice> list = new ArrayList<Notice>();
	String sql;
	
	/**
	 * 메인 최신 공지사항
	 * */
	public ArrayList<Notice> mainNotice() {
		conn = DBUtil.connection();
		sql = "SELECT NOTICE_UNIQUE_KEY, NOTICE_TITLE, NOTICE_DATE FROM NOTICE ORDER BY NOTICE_DATE DESC LIMIT 5;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int noticeUniqueKey = rs.getInt("NOTICE_UNIQUE_KEY");
				String noticeTitle = rs.getString("NOTICE_TITLE");
				String noticeDate = rs.getString("NOTICE_DATE");
				
				Notice notice = new Notice(noticeUniqueKey, noticeTitle, noticeDate);
				
				list.add(notice);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 공지사항 리스트
	 * */
	public ArrayList<Notice> noticeList() {
		conn = DBUtil.connection();
		sql = "";
		try {
			pstmt.executeQuery();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 공지사항 등록
	 * */
	
	/**
	 * 공지사항 수정
	 * */
	
	/**
	 * 공지사항 삭제
	 * */
}
