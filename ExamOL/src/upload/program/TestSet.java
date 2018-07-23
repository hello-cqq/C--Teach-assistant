package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.text.SimpleDateFormat;


public class TestSet extends DBMessage{
	public int addTest (String... inf)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		ResultSet rs=null;
		String creator = "";
		String datetime="";
		String sql1="SELECT teachnum FROM course where num="+inf[2];
		rs=st.executeQuery(sql1);
		while(rs.next()){
			creator=rs.getString("teachnum");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    datetime=df.format(new Date());// new Date()为获取当前系统时间

		String sql2="INSERT INTO test(name,q_num,creator,course,time)"
				+" VALUES ('"+inf[0]+"','"+inf[1]+"','"+creator+"','"+inf[2]+"','"+datetime+"')";
		st.executeUpdate(sql2);
		rs.close();
		st.close();
		conn.close();
		return 1;
	}

}
