package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AddClass extends DBMessage{
	public int addClass (String num,String classnum)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		ResultSet rs=null;
		String oldClass="";
		String newClass="";
		String sql1="SELECT addclass FROM user where number="+num;
		rs=st.executeQuery(sql1);
		while(rs.next()){
			oldClass = rs.getString("addclass");
		}
		System.out.println(oldClass);
		newClass = oldClass+classnum+";";
		System.out.println(newClass);
		String sql2="update user set addclass="+"'"+newClass+"'"+" where number ="+"'"+num+"'";
		System.out.println(sql2);
		st.executeUpdate(sql2);
		rs.close();
		st.close();
		conn.close();
		return 1;
	}

}
