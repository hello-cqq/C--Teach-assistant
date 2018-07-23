package upload.program;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginProgram extends DBMessage{
	public String[] user_validate (String number,String password)throws Exception
	{
		Connection conn=this.ConnectDB();
		String[] result=new String[5];
		int flag = 0; 
		result[0] = flag+"";
		ResultSet rs=null;
		String sql="SELECT name,number,password,class,addclass FROM user";
		Statement st=conn.createStatement();
		rs=st.executeQuery(sql);
		while(rs.next()){
			if(number.equals(rs.getString("number"))&&password.equals(rs.getString("password"))){
				flag = 1;
				result[0]=flag+"";
				result[1]=rs.getString("name");
				result[2]=rs.getString("number");
				result[3]=rs.getString("class");
				result[4]=rs.getString("addclass");
				//System.out.println(result[0]);
				return result;
			}
		}
		rs.close();
		st.close();
		conn.close();
		return result;
	}
	
	public String[] admin_validate (String number,String password)throws Exception
	{
		Connection conn=this.ConnectDB();
		String[] result=new String[4];
		int flag = 0; 
		result[0]=flag+"";
		ResultSet rs=null;
		String sql="SELECT name,number,password,power FROM admin";
		Statement st=conn.createStatement();
		rs=st.executeQuery(sql);
		while(rs.next()){
			if(number.equals(rs.getString("number"))&&password.equals(rs.getString("password"))){
				flag = 1;
				result[0]=flag+"";
				result[1]=rs.getString("name");
				result[2]=rs.getString("number");
				result[3]=rs.getInt("power")+"";
				return result;
			}
		}
		rs.close();
		st.close();
		conn.close();
		return result;
	}


}
