package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gymCarryProject.ConnectionPool;

public class RBoardDAO {
	private int result;
	private Connection con;
	private ConnectionPool pool;
	private ResultSet rs;

	public RBoardDAO() throws ClassNotFoundException {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPWD = "tiger";
			Class.forName("oracle.jdbc.OracleDriver");

			pool = ConnectionPool.getInstance(dbURL, dbID, dbPWD, 3, 4, true, 500);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() throws SQLException {
		con = pool.getConnection();
		String sql = "SELECT BOARD_NO FROM R_BOARD ORDER BY BOARD_NO DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e){
				e.printStackTrace(); 
			}
			
		return -1;
	}

	
	public int write(BoardDTO boardDTO) throws SQLException {
		con = pool.getConnection();
		String sql = "insert into R_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
	            + ", parent, viewcnt)" + "values(?, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardDTO.getUserId());
			pstmt.setString(3, boardDTO.getLocal());
			pstmt.setString(4, boardDTO.getCompanyName());
			pstmt.setString(5, boardDTO.getBoardTitle());
			pstmt.setString(6, boardDTO.getBoardContent());	
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();	
		}
		return -1;
	}
	
	// 특정한 페이지에 있는 게시글들을 10개씩 보여주기
	public ArrayList<BoardDTO> getList(int pageNumber){
		String sql = "SELECT * FROM R_BOARD WHERE < ? ORDER BY BOARD_NO DESC LIMIT 10";
		
		
		
		
		
		return null;
	}
	
}
