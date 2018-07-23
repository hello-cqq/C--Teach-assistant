package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CourseSet extends DBMessage{
	public int courseDelete (String delnum)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		String sql="delete from course where num="+delnum;
		//System.out.println(sql);
		st.executeUpdate(sql);
		st.close();
		conn.close();
		return 1;
	}
	public int addCourse (String... inf)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		ResultSet rs=null;
		
		String sql1="SELECT num FROM course";
		rs=st.executeQuery(sql1);
		while(rs.next()){
			if(inf[1].equals(rs.getString("num"))){
				return -1;
			}
		}
		String sql2="INSERT INTO course(name,num,teacher,teachnum)"
				+" VALUES ('"+inf[0]+"','"+inf[1]+"','"+inf[2]+"','"+inf[3]+"')";
		st.executeUpdate(sql2);
		rs.close();
		st.close();
		conn.close();
		return 1;
	}

}
