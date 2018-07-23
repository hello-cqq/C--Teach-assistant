package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
import java.io.*;

public class ProblemSet extends DBMessage{
	private static String pro_path="E:/ExamOL/Problem";
	public int addProblem (String... inf)throws Exception
	{
		Connection conn=this.ConnectDB();
		Statement st=conn.createStatement();
		
		String sql="INSERT INTO problem(title,type,difficulty,score)"
				+" VALUES ('"+inf[1]+"','"+inf[2]+"','"+inf[3]+"','"+inf[4]+"')";
		st.executeUpdate(sql);
		ResultSet rs=null;
		int id = 0;
		String sql1="SELECT id FROM problem order by id desc limit 1";
		rs=st.executeQuery(sql1);
		while(rs.next()){
			id=rs.getInt("id");
		}
		rs.close();
		st.close();
		conn.close();
		PrintStream ps = null;
		File file = new File(pro_path+"/"+id);
		if(!file.exists())
		{
			file.mkdirs();
		}
		File pro_file = new File(pro_path+"/"+id+"/"+"problem.txt");
		if(!pro_file.exists())
		{
			pro_file.createNewFile();
		}
		ps = new PrintStream(new FileOutputStream(pro_file));
		ps.println(inf[0]);
		ps.close();
		return 1;
	}

}
