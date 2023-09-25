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
		PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int result = rs.getInt(1) + 1;
				pstmt.close();
				pool.releaseConnection(con);
				return result;
			}else {
				return 1;
			}
	}

	
	public int write(BoardDTO boardDTO) throws SQLException {
		con = pool.getConnection();
		String sql = "insert into R_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
	            + ", parent, viewcnt)" + "values(?, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, boardDTO.getUserId());
		pstmt.setString(3, boardDTO.getLocal());
		pstmt.setString(4, boardDTO.getCompanyName());
		pstmt.setString(5, boardDTO.getBoardTitle());
		pstmt.setString(6, boardDTO.getBoardContent());	
		pstmt.close();
		pool.releaseConnection(con);
		return pstmt.executeUpdate();		
	}
	
	// 특정한 페이지에 있는 게시글들을 10개씩 보여주기
	public ArrayList<BoardDTO> getList() throws SQLException{
		con = pool.getConnection();
		String sql = "SELECT board_no, id, local, company_name, board_title, board_regdate, viewcnt FROM R_BOARD ORDER BY BOARD_NO DESC";
		ArrayList<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
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
		pstmt.close();
//		pool.releaseConnection(con);
		return list;
	}
	
	public BoardDTO getBoard(int boardNum) throws SQLException {
		con = pool.getConnection();
		String sql = "SELECT board_no, id, local, company_name, board_title, board_content ,board_regdate, viewcnt FROM R_BOARD WHERE BOARD_NO = ?"; 
		PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				upViewCnt(boardNum);
				BoardDTO dto = new BoardDTO();
				dto.setBoardNum(rs.getInt(1));
				dto.setUserId(rs.getString(2));
				dto.setLocal(rs.getString(3));
				dto.setCompanyName(rs.getString(4));
				dto.setBoardTitle(rs.getString(5));
				dto.setBoardContent(rs.getString(6));
				dto.setBoardRegdate(rs.getDate(7));
				dto.setViewCnt(rs.getInt(8));

				return dto;
			}
		pstmt.close();
		pool.releaseConnection(con);
		return null;
	}
	
	   public int upViewCnt (int num) throws SQLException {
		      PreparedStatement stmt = null;
		      String sql ="update r_board set viewcnt = viewcnt+1 where board_no=?";
		      int result = -1;
		      
		         con = pool.getConnection();
		         stmt = con.prepareStatement(sql);
		         stmt.setInt(1, num);
		         result = stmt.executeUpdate();
				pool.releaseConnection(con);
		      return result; // 조회수 상승
		   }
	
	
}
