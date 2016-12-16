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
	public ArrayList<Board> mainBoard() {
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
	public ArrayList<Board> recipeList() {
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
