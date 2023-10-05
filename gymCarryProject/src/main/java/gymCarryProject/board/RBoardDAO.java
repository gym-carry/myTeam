package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gymCarryProject.ConnectionPool;

public class RBoardDAO {
	String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbID = "scott";
	String dbPWD = "tiger";
	private int result;
	private Connection con;
	private ConnectionPool pool;
	private ResultSet rs;
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";   

	public RBoardDAO() throws ClassNotFoundException {
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
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
	            + ", parent, viewcnt)" + " values(?, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, boardDTO.getUserId());
		pstmt.setString(3, boardDTO.getLocal());
		pstmt.setString(4, boardDTO.getCompanyName());
		pstmt.setString(5, boardDTO.getBoardTitle());
		pstmt.setString(6, boardDTO.getBoardContent());	
		//pstmt.close();
		//pool.releaseConnection(con);
		return pstmt.executeUpdate();		
	}
	
	// 특정한 페이지에 있는 게시글들을 10개씩 보여주기
	public ArrayList<BoardDTO> getList() throws SQLException{
		con = pool.getConnection();
		String sql = "SELECT board_no, id, local, company_name, board_title, board_regdate, viewcnt FROM R_BOARD ORDER BY BOARD_NO DESC";
		BoardDTO dto = null;
		ArrayList<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setBoardNum(rs.getInt(1));
				dto.setUserId(rs.getString(2));
				dto.setLocal(rs.getString(3));
				dto.setCompanyName(rs.getString(4));
				dto.setBoardTitle(rs.getString(5));
				dto.setBoardRegdate(rs.getDate(6));
				dto.setViewCnt(rs.getInt(7));
				list.add(dto);
			}
		System.out.println(dto);
		pstmt.close();
		rs.close();
		pool.releaseConnection(con);
		return list;
	}
	
	public BoardDTO getBoard(int boardNum) throws SQLException {
		con = pool.getConnection();
		String sql = "SELECT board_no, id, local, company_name, board_title, board_content ,board_regdate, viewcnt FROM R_BOARD WHERE BOARD_NO = ?"; 
		PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			BoardDTO dto = null;
			while(rs.next()) {
				upViewCnt(boardNum);
				dto = new BoardDTO();
				dto.setBoardNum(rs.getInt(1));
				dto.setUserId(rs.getString(2));
				dto.setLocal(rs.getString(3));
				dto.setCompanyName(rs.getString(4));
				dto.setBoardTitle(rs.getString(5));
				dto.setBoardContent(rs.getString(6));
				dto.setBoardRegdate(rs.getDate(7));
				dto.setViewCnt(rs.getInt(8));
			}
		System.out.println(dto);
		rs.close();
		pstmt.close();
		//pool.releaseConnection(con);
		return dto;
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
	
	   public int update(BoardDTO dto) throws SQLException {
		      PreparedStatement stmt = null;
		      String sql = "update R_BOARD set board_title=?, board_content=? where board_no=? ";
		      int result = -1; // 수정 오류
		      con = pool.getConnection();
		      stmt = con.prepareStatement(sql);
		      stmt.setString(1, dto.getBoardTitle());
		      stmt.setString(2, dto.getBoardContent());
		      stmt.setInt(3, dto.getBoardNum());
		      System.out.println(stmt.toString());

		      result = stmt.executeUpdate();
		      System.out.println(result);
		      stmt.close();

		      pool.releaseConnection(con);

		      return result; // 성공적으로 등록되면 1 반환
		   }
	   public int delete(int num) throws SQLException {
		      PreparedStatement stmt = null;
		      String sql = "delete from r_board where board_no =?";
		      int result = -1;

		      con = pool.getConnection();
		      stmt = con.prepareStatement(sql);
		      stmt.setInt(1, num);

		      result = stmt.executeUpdate();

		      stmt.close();
		      pool.releaseConnection(con);
		      return result; // 성공적으로 등록되면 1 반환
		   }
}