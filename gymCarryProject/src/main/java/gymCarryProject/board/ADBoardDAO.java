package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			System.out.println("pool 연결");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int insert(BoardDTO dto) throws SQLException {
		System.out.println(dto.toString());
		PreparedStatement stmt = null;
		String sql = "insert into AD_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
				+ ", parent, viewcnt)" + "values(AD_BOARD_SEQ.NEXTVAL, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		int result = -1;
		try {
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setString(1, dto.getUserId());
		stmt.setString(2, dto.getLocal());
		stmt.setString(3, dto.getCompanyName());
		stmt.setString(4, dto.getBoardTitle());
		stmt.setString(5, dto.getBoardContent());
		System.out.println(stmt.toString());

		result = stmt.executeUpdate();
		System.out.println(result);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) {
				stmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return result;
	}
	
	public ArrayList<BoardDTO> selectAll() throws SQLException {
		PreparedStatement stmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD ";
		ArrayList<BoardDTO> ls = new ArrayList();
		System.out.println(ls.toString());
		
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO (rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
						rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"), rs.getDate("board_regdate"), rs.getInt("viewcnt") );
				
				ls.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return ls;
	}

	public BoardDTO select(int num) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD  where board_no =?";
		BoardDTO dto = null;
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			System.out.println(stmt.toString());
			rs = stmt.executeQuery();
			if (rs.next()) {
				dto = new BoardDTO (rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
						rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"), rs.getDate("board_regdate"), rs.getInt("viewcnt") );
				System.out.println(dto);
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return dto;
	}
}
