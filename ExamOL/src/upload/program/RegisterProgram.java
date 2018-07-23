package upload.program;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class RegisterProgram extends DBMessage{
	public int user_save (String... userInf)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		ResultSet rs=null;
		
		String sql1="SELECT number FROM user";
		rs=st.executeQuery(sql1);
		while(rs.next()){
			if(userInf[1].equals(rs.getString("number"))){
				return -1;
			}
		}
		String sql2="INSERT INTO user(name,number,password,class)"
				+" VALUES ('"+userInf[0]+"','"+userInf[1]+"','"+userInf[2]+"','"+userInf[3]+"')";
		st.executeUpdate(sql2);
		rs.close();
		st.close();
		conn.close();
		return 1;
	}
}
