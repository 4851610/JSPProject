package board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	ArrayList<Board> list = new ArrayList<Board>();

	/**
	 * 메인 명예의 전당 이미지
	 */
	public ArrayList<Board> bestRecipe() {
		conn = DBUtil.connection();
		sql = "SELECT recipe_image FROM recipe ORDER BY recipe_like DESC limit 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String recipeImage = rs.getString("recipe_image");

				Board board = new Board(recipeImage);

				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	/**
	 * 메인 최신 게시글 이미지
	 */
	public ArrayList<Board> latestBoard() {
		conn = DBUtil.connection();
		sql = "select recipe_image from recipe order by recipe_unique_key desc limit 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String recipeImage = rs.getString("recipe_image");

				Board board = new Board(recipeImage);

				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 게시판 리스트
	 * */
	public ArrayList<Board> list() {
		conn = DBUtil.connection();
		sql = "";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String recipeImage = rs.getString("recipe_image");

				Board board = new Board(recipeImage);

				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	String Query3 = "select n.notice_title, n.notice_date, r.review_image, r.review_title from notice n, review r order by n.notice_unique_key desc, r.review_unique_key desc limit 5";

}
