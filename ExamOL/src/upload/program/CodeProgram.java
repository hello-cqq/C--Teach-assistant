package upload.program;

import java.io.*;
import java.util.Date;
import java.util.Scanner;
import java.util.regex.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
public class CodeProgram extends DBMessage{
	
	//banji,num,filename,code
	public String compileResult (String... codemsg)
	{
		
		String submit_path="E:/ExamOL/Exam";
		//System.setProperty("java.security.policy", "java.policy");
		//System.setSecurityManager(new SecurityManager());
		String message = null;
		String path = null;
		String newcode = null;//添加重定向后的代码
		String insertcode ="";//需要插入的重定向代码段
		String c_name = null;//c文件完整路径
		StringBuilder oldcode = null;
		String teacher = "";
		String courseNum = "";
		String examName = "";
		String courseName = "";
		String datetime="";
		String[] q_nums=null;
		try {
			Connection conn=this.ConnectDB();
			Statement st=conn.createStatement();
			ResultSet rs=null;

			String sql1="SELECT * FROM test where id="+codemsg[5];
			rs=st.executeQuery(sql1);
			while(rs.next()){
				courseNum=rs.getString("course");
				examName=rs.getString("name");
				q_nums=rs.getString("q_num").split(";");
			}
			String sql3="SELECT * FROM course where num="+courseNum;
			rs=st.executeQuery(sql3);
			while(rs.next()){
				teacher=rs.getString("teacher");
				courseName=rs.getString("name");
			}
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		    datetime=df.format(new Date());// new Date()为获取当前系统时间
		    
			String sql2="INSERT INTO submit(user_id,class,test,score,time)"
					+" VALUES ('"+codemsg[1]+"','"+courseNum+"','"+codemsg[5]+"','"+"0"+"','"+datetime+"')";
			st.executeUpdate(sql2);
			rs.close();
			st.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "Exception";
		}
		
		try {
			Scanner sc = new Scanner(new File("E:/ExamOL/blackname.txt"));
			while(sc.hasNextLine()){
				insertcode+=(sc.nextLine()+"\n");
			}
			sc.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "Exception";
		}
		if(codemsg[3]!=null){
			//用户上传得到的代码
			oldcode = new StringBuilder(codemsg[3]);
			//黑名单
			//insertcode = "#define system errorNo1\n";
//			insertcode = "//直接在java里重定向";
			//正则匹配两个作用：
			//1.对用户的代码进行规范检查，初步判断是否通过
			//2.帮助 添加重定向语句到正确位置
			
			Pattern p = Pattern.compile("int[\\s]*main[\\s]*\\(\\)\\s*\\{");
			Matcher matcher =p.matcher(codemsg[3]);
			int i =0;
			while(matcher.find()){
				//限制一个main函数
				++i;
				oldcode.insert(matcher.start(), insertcode);
				newcode = oldcode.toString();
			}
			//限制一个main函数
			if(i!=1) return "编译不通过，请检查代码main函数格式是否正确";	
		}
		//代码不能为空
		else return "编译不通过，请完善代码";
		//System.out.println(newcode);
		try {
			//设置代码(.c文件)的存放路径
			
			path =submit_path+"/"+teacher+"/"+courseName+"/"+examName+"/"+codemsg[0]+"/"+codemsg[4]+"/"+codemsg[6];
			File userfiledir = new File(path);
			File usrf = null;
			PrintStream ps = null;
			if(!userfiledir.exists())
			{
				Boolean b1 =userfiledir.mkdirs();
				if(b1){
					c_name = path+"/"+codemsg[2]+".c";//路径+文件名
					//System.out.println(c_name);
				}
				else return "Exception";
			}
			else {
				c_name = path+"/"+codemsg[2]+".c";
			}
			usrf = new File(c_name);
			//代码写入文件
			if(!usrf.exists()){
				Boolean b2 =usrf.createNewFile();
				if(b2){
					ps = new PrintStream(new FileOutputStream(usrf));
					ps.println(newcode);
				}
				else return "Exception";
			}
			else{
				ps = new PrintStream(new FileOutputStream(usrf));
				ps.println(newcode);
			}
			ps.close();
			String s = q_nums[new Integer(codemsg[6])-1];
			//编译生成可执行文件，指定文件名
			message =new CodeCompile().codeCompile(codemsg[2], path,s);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return message;
	}

}
