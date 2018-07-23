package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminSet extends DBMessage{
	public int adminDelete (String delnum)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		String sql="delete from admin where number="+delnum;
		//System.out.println(sql);
		st.executeUpdate(sql);
		st.close();
		conn.close();
		return 1;
	}
	public int powerEdit (String alternum,String power)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		String sql="update admin set power="+power+" where number ="+alternum;
		//System.out.println(sql);
		st.executeUpdate(sql);
		st.close();
		conn.close();
		return 1;
	}
	public int addAdmin (String... inf)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		ResultSet rs=null;
		
		String sql1="SELECT number FROM admin";
		rs=st.executeQuery(sql1);
		while(rs.next()){
			if(inf[1].equals(rs.getString("number"))){
				return -1;
			}
		}
		String sql2="INSERT INTO admin(name,number,password,power)"
				+" VALUES ('"+inf[0]+"','"+inf[1]+"','"+inf[2]+"','"+inf[3]+"')";
		st.executeUpdate(sql2);
		rs.close();
		st.close();
		conn.close();
		return 1;
	}

}
