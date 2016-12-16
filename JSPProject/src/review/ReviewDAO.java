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

	/**
	 * 메인 최신 리뷰
	 * */
	public ArrayList<Review> mainList() {
		conn = DBUtil.connection();
		sql = "SELECT REVIEW_UNIQUE_KEY, REVIEW_TITLE, REVIEW_IMAGE FROM REVIEW ORDER BY REVIEW_DATE DESC LIMIT 5;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewUniqueKey = rs.getInt("REVIEW_UNIQUE_KEY");
				String reviewTitle = rs.getString("REVIEW_TITLE");
				String reviewImage = rs.getString("REVIEW_IMAGE");
				
				Review review = new Review(reviewUniqueKey, reviewTitle, reviewImage);
				
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}
	
	/**
	 * 리뷰 리스트
	 * */
	public ArrayList<Review> reviewList() {
		conn = DBUtil.connection();
		sql = "";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewUniqueKey = rs.getInt("");
				String reviewTitle = rs.getString("");
				String reviewImage = rs.getString("");
				
				Review review = new Review(reviewUniqueKey, reviewTitle, reviewImage);
				
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}
	
	/**
	 * 리뷰 등록
	 * */
	
	/**
	 * 리뷰 수정
	 * */
	
	/**
	 * 리뷰 삭제
	 * */
}
