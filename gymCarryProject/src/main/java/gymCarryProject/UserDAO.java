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
	
	public UserDTO select(UserDTO input) throws SQLException {
//	    Connection con = null;
////	    PreparedStatement stmt = null;
//	    ResultSet rs = null;
		
		
		con = pool.getConnection();
		String sql = "select * from R_USER where id = '" + input.getId() + "'and pwd = '" + input.getPwd() + "'";
		System.out.println(sql);
		PreparedStatement stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		UserDTO user = null;
		while(rs.next()) {
			user = new UserDTO(rs.getString("id"),rs.getString("name"), rs.getString("pwd"), rs.getString("email"), rs.getString("phone"));
		}
		System.out.println(user);
		rs.close();
		stmt.close();
		pool.releaseConnection(con);
		return user;
	}
	
	public int login(String id, String pwd) throws SQLException, ClassNotFoundException {
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        Class.forName("oracle.jdbc.OracleDriver");
	        con = pool.getConnection();
	        String sql = "SELECT PWD FROM R_USER WHERE ID=?";
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, id);
	        rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            if (rs.getString(1).equals(pwd)) {
	                return 1;
	            } else {
	                return 0;
	            }
	        }
	        
	        return -1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -2; // 데이터베이스 오류
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (stmt != null) {
	                stmt.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

}