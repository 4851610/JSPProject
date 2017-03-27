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
		sql = "SELECT recipe_unique_key, recipe_image FROM recipe ORDER BY recipe_like DESC limit 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int recipeUniqueKey = rs.getInt("recipe_unique_key");
				String recipeImage = rs.getString("recipe_image");
 
				Board board = new Board(recipeUniqueKey, recipeImage);

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
	public ArrayList<Board> mainBoard() {
		conn = DBUtil.connection();
		sql = "select recipe_unique_key, recipe_image from recipe order by recipe_unique_key desc limit 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int recipeUniqueKey = rs.getInt("recipe_unique_key");
				String recipeImage = rs.getString("recipe_image");

				Board board = new Board(recipeUniqueKey, recipeImage);

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
	 * 총 게시글 수
	 * */
	public int totalRecord() {
		conn = DBUtil.connection();
		sql = "SELECT COUNT(*) FROM recipe;";
		int totalRecords = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecords = rs.getInt("COUNT(*)");
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
		return totalRecords;
	}
	
	/**
	 * 게시판 리스트
	 * */
	public ArrayList<Board> recipeList() {
		conn = DBUtil.connection();
		sql = "SELECT RECIPE_UNIQUE_KEY, RECIPE_TITLE, USER_NAME, RECIPE_DATE FROM RECIPE r LEFT JOIN MEMBER m ON r.USER_UNIQUE_KEY = m.USER_UNIQUE_KEY ORDER BY RECIPE_UNIQUE_KEY DESC;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int recipeUniqueKey = rs.getInt("RECIPE_UNIQUE_KEY");
				String recipeTitle = rs.getString("RECIPE_TITLE");
				String userName = rs.getString("USER_NAME");
				String recipeDate = rs.getString("RECIPE_DATE");

				Board board = new Board(recipeUniqueKey, recipeTitle, userName, recipeDate);

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
	 * 레시피 글보기
	 * */
	public ArrayList<Board> recipeContent(int recipeUniqueKey) {
		conn = DBUtil.connection();
		sql = "SELECT RECIPE_TITLE, RECIPE_LIKE, RECIPE_DATE, RECIPE_CONTENT, RECIPE_IMAGE, USER_NAME, CATEGORIZE_NAME FROM RECIPE r LEFT JOIN MEMBER m ON r.USER_UNIQUE_KEY = m.USER_UNIQUE_KEY LEFT JOIN CATEGORIZE c ON r.CATEGORIZE_UNIQUE_KEY = c.CATEGORIZE_UNIQUE_KEY WHERE r.RECIPE_UNIQUE_KEY=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeUniqueKey);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String recipeTitle = rs.getString("RECIPE_TITLE");
				int recipeLike = rs.getInt("RECIPE_LIKE");
				String recipeDate = rs.getString("RECIPE_DATE");
				String recipeContent = rs.getString("RECIPE_CONTENT");
				String recipeImage = rs.getString("RECIPE_IMAGE");
				String userName = rs.getString("USER_NAME");
				String categorizeName = rs.getString("CATEGORIZE_NAME");

				Board board = new Board(recipeTitle, recipeLike, recipeDate, recipeContent, recipeImage, userName, categorizeName);

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
	 * 레시피 등록
	 * */
	
	/**
	 * 레시피 수정
	 * */
	
	/**
	 * 레시피 삭제
	 * */
}
