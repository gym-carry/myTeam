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
	    String dbID =  "scott";
	    String dbPWD = "tiger";
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
		con = pool.getConnection();
		String sql = "select * from board where id = '" + input.getId() + "'and pwd = '" + input.getPwd() + "'";
		PreparedStatement stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
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
	
	public int loginCheck(String id, String pwd) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dbPWD = "";
		int x = -1; // 아이디를 잘못 입력햇을 시 -1
		
		try {
			StringBuffer query = new StringBuffer();
            query.append("SELECT PASSWORD FROM R_USER WHERE ID=?");
            
            conn = pool.getConnection();
            stmt = conn.prepareStatement(query.toString());
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            
            if(rs.next()) {
            	dbPWD = rs.getString("password");
            	
            	if(dbPWD.equals(pwd)) {
            		x = 1;
            	}else {
            		x = 0;
            	}
            }else {
            	x = -1;
            }
            
            return x;
		}catch(Exception sqle){
			throw new RuntimeException(sqle.getMessage());
		}finally {
            try{
                if ( stmt != null ){ stmt.close(); stmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}
}
