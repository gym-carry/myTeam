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
				int result = rs.getInt(1) + 1;
				return result;
			}else {
				return 1;
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
	public ArrayList<BoardDTO> getList(int pageNumber) throws SQLException{
		con = pool.getConnection();
		String sql = "SELECT * FROM (SELECT * FROM R_BOARD WHERE BOARD_NO < ? ORDER BY BOARD_NO DESC) WHERE ROWNUM <= 10;";
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoardNum(rs.getInt(1));
				dto.setUserId(rs.getString(2));
				dto.setLocal(rs.getString(3));
				dto.setCompanyName(rs.getString(4));
				dto.setBoardTitle(rs.getString(5));
				dto.setBoardRegdate(rs.getDate(6));
				dto.setViewCnt(rs.getInt(7));
				list.add(dto);
			}
		}catch(Exception e) {
		e.printStackTrace();
	}
		return list;
	}
}
