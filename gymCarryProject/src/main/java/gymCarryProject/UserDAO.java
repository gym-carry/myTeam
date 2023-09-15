package gymCarryProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

	private int result;
	
	private Connection con;
	private ConnectionPool pool;
	private ResultSet rs;
	
	public UserDAO () throws ClassNotFoundException {
		try {
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	    String dbID =  "hr";
	    String dbPWD = "hr";
	    Class.forName("oracle.jdbc.OracleDriver");
	    
	    pool = ConnectionPool.getInstance(dbURL, dbID, dbPWD, 3, 4, true, 500);
	} catch(SQLException e) {
		e.printStackTrace();
		}
	}
	
	public int insert (UserDTO dto) throws SQLException {
		con = pool.getConnection();
		String sql = "insert into R_USER(id, name, pwd, email, phone)"
		+ "VALUES(?, ?, ?, ?, ?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		
		System.out.println(sql);
		stmt.setString(1, dto.getId());
		stmt.setString(2, dto.getName());
		stmt.setString(3, dto.getPwd());
		stmt.setString(4, dto.getEmail());
		stmt.setString(5, dto.getPhone());
		
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(con);
		return result;
		
	}
}
