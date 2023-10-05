package gymCarryProject.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gymCarryProject.ConnectionPool;

public class ADBoardDAO {

	private String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbID = "hr";
	private String dbPWD = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private ResultSet rs;
	private Connection con;

	public ADBoardDAO() {
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			pool = ConnectionPool.getInstance(dbURL, dbID, dbPWD, 3, 5, true, 1000);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게시물 번호를 1부터 설정할 수 있도록 해주는 함수
	public int getNext() throws SQLException {
		int result = 0;
		String sql = "SELECT BOARD_NO FROM R_BOARD ORDER BY BOARD_NO DESC";

		PreparedStatement pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println(rs.next());
		if (rs.next()) {
			result = rs.getInt(1) + 1;		
			return result;
		} else {
			return 1; // 게시물이 첫번째인 경우
		}
	}

	public int insert(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into AD_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate, parent, viewcnt) values(?, ?, ?, ?, ?, ?, sysdate, 0, 0)";
		int result = -1; // 게시글 등록 오류
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, getNext());
		pstmt.setString(2, dto.getUserId());
		pstmt.setString(3, dto.getLocal());
		pstmt.setString(4, dto.getCompanyName());
		pstmt.setString(5, dto.getBoardTitle());
		pstmt.setString(6, dto.getBoardContent());
		System.out.println(pstmt.toString());

		result = pstmt.executeUpdate();
		System.out.println(result);
		pstmt.close();
		pool.releaseConnection(con);

		return result; // 성공적으로 등록되면 1 반환
	}

	public ArrayList<BoardDTO> selectAll() throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD ";
		ArrayList<BoardDTO> ls = new ArrayList<>();

		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println(rs.toString());
		System.out.println("여기");
		while (rs.next()) {
			BoardDTO dto = new BoardDTO(rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
					rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"),
					rs.getDate("board_regdate"), rs.getInt("viewcnt"));

			ls.add(dto);
		}

		rs.close();
		pstmt.close();
		pool.releaseConnection(con);
		return ls;
	}

	public BoardDTO select(int num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD  where board_no =?";
		BoardDTO dto = null;

		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		System.out.println(pstmt.toString());
		rs = pstmt.executeQuery();
		if (rs.next()) {
			upViewCnt(num);
			dto = new BoardDTO(rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
					rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"),
					rs.getDate("board_regdate"), rs.getInt("viewcnt"));
			return dto;
		}

		rs.close();
		pstmt.close();
		pool.releaseConnection(con);
		return dto;
	}

	public int upViewCnt(int num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update ad_board set viewcnt = viewcnt+1 where board_no=?";
		int result = -1;
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(con);
		return result; // 조회수 상승
	}

	// 수정하기 > 등록하기와 유사하다
	public int update(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update AD_BOARD set board_title=?, board_content=? where board_no=? ";
		int result = -1; // 수정 오류
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getBoardTitle());
		pstmt.setString(2, dto.getBoardContent());
		pstmt.setInt(3, dto.getBoardNum());
		System.out.println(pstmt.toString());

		result = pstmt.executeUpdate();
		System.out.println(result);
		pstmt.close();

		pool.releaseConnection(con);

		return result; // 성공적으로 등록되면 1 반환
	}

	public int delete(int num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "delete from ad_board where board_no =?";
		int result = -1;

		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);

		result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(con);
		return result; // 성공적으로 등록되면 1 반환
	}

}
