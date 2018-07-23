package upload.program;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
public class DBMessage {
	public final String dbdriver="com.mysql.jdbc.Driver";
	public final String dburl="jdbc:mysql://localhost:3306/examol?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=UTF8";
	public final String dbuser="root";
	public final String dbpwd="1996@cqq";
	public Connection  ConnectDB (){
		Connection conn=null;
		try{
			Class.forName(dbdriver);
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			conn=DriverManager.getConnection(dburl,dbuser,dbpwd);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
}
