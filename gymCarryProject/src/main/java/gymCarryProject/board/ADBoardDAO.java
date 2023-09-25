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
			pool = ConnectionPool.getInstance(dbURL, dbID, dbPWD, 3, 5, true, 500);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게시물 번호를 1부터 설정할 수 있도록 해주는 함수
	public int getNext() {
		int result = 0;
		String sql = "select id from ad_board order by desc";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1) + 1;
				return result;
			} else {
				return 1; // 게시물이 첫번째인 경우
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 게시물이 없는 경우
	}

	public int insert(BoardDTO dto) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "insert into AD_BOARD(board_no, id, local, company_name, board_title, board_content, board_regdate"
				+ ", parent, viewcnt)" + "values(?, ?, ?, ? , ? ,? ,sysdate, 0, 0)";
		int result = -1; // 게시글 등록 오류
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, getNext());
		stmt.setString(2, dto.getUserId());
		stmt.setString(3, dto.getLocal());
		stmt.setString(4, dto.getCompanyName());
		stmt.setString(5, dto.getBoardTitle());
		stmt.setString(6, dto.getBoardContent());
		System.out.println(stmt.toString());

		result = stmt.executeUpdate();
		System.out.println(result);
		pool.releaseConnection(con);

		return result; // 성공적으로 등록되면 1 반환
	}

	public ArrayList<BoardDTO> selectAll() throws SQLException {
		PreparedStatement stmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD ";
		ArrayList<BoardDTO> ls = new ArrayList<>();
		System.out.println(sql);
		System.out.println(ls.toString());
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		System.out.println(rs.toString());
		System.out.println("여기");
		while (rs.next()) {
			BoardDTO dto = new BoardDTO(rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
					rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"),
					rs.getDate("board_regdate"), rs.getInt("viewcnt"));

			ls.add(dto);
		}

		rs.close();
		stmt.close();
		pool.releaseConnection(con);
		return ls;
	}

	public BoardDTO select(int num) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "select board_no, id, local, company_name, board_title, board_content, board_regdate, viewcnt from AD_BOARD  where board_no =?";
		BoardDTO dto = null;

		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, num);
		System.out.println(stmt.toString());
		rs = stmt.executeQuery();
		if (rs.next()) {
			upViewCnt(num);
			dto = new BoardDTO(rs.getInt("board_no"), rs.getString("id"), rs.getString("local"),
					rs.getString("company_name"), rs.getString("board_title"), rs.getString("board_content"),
					rs.getDate("board_regdate"), rs.getInt("viewcnt"));
			return dto;
		}

		rs.close();
		stmt.close();
		pool.releaseConnection(con);
		return dto;
	}

	public int upViewCnt(int num) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "update ad_board set viewcnt = viewcnt+1 where board_no=?";
		int result = -1;
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, num);
		result = stmt.executeUpdate();

		stmt.close();
		pool.releaseConnection(con);
		return result; // 조회수 상승
	}

	// 수정하기 > 등록하기와 유사하다
	public int update(BoardDTO dto) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "update AD_BOARD set board_title=?, board_content=? where board_no=? ";
		int result = -1; // 수정 오류
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setString(1, dto.getBoardTitle());
		stmt.setString(2, dto.getBoardContent());
		stmt.setInt(3, getNext());
		System.out.println(stmt.toString());

		result = stmt.executeUpdate();
		System.out.println(result);
		stmt.close();

		pool.releaseConnection(con);

		return result; // 성공적으로 등록되면 1 반환
	}

	public int delete(int num) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "delete from ad_board where board_no =?";
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
