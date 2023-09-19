package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	
	public int write(BoardDTO boardDTO) throws SQLException {
		con = pool.getConnection();
		String sql = "insert into AD_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
	            + ", parent, viewcnt)" + "values(R_BOARD_SEQ.NEXTVAL, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getUserId());
			pstmt.setString(2, boardDTO.getLocal());
			pstmt.setString(3, boardDTO.getCompanyName());
			pstmt.setString(4, boardDTO.getBoardTitle());
			pstmt.setString(5, boardDTO.getBoardContent());	
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();	
			}
		return -1;
	}
	
	
	
}
