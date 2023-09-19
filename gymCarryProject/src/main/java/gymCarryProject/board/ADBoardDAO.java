package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gymCarryProject.ConnectionPool;

public class ADBoardDAO {

	private ConnectionPool pool;
	private ResultSet rs;
	private Connection con;
	
	public ADBoardDAO() throws ClassNotFoundException {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "hr";
			String dbPWD = "hr";
			Class.forName("oracle.jdbc.OracleDriver");

			pool = ConnectionPool.getInstance(dbURL, dbID, dbPWD, 3, 4, true, 500);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insert (BoardDTO dto) {
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "insert into AD_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
					+ ", parent, viewcnt)"+"values(AD_BOARD_SEQ.nextval, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
			PreparedStatement stmt = con.prepareStatement(sql);
			System.out.println(sql);
			
			stmt.setString(1, dto.getUserId());
			stmt.setString(2, dto.getLocal());
			stmt.setString(3, dto.getCompanyName());
			stmt.setString(4, dto.getBoardTitle());
			stmt.setString(5, dto.getBoardContent());
			
			result = stmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
