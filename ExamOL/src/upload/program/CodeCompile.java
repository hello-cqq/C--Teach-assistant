package upload.program;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class CodeCompile {
	public String codeCompile(String filename,String path,String tikunum)
	{
		Process process = null;
		String message = null;
		try {
			process = Runtime.getRuntime().exec("cmd /c gcc -o "+"R"+filename+" "+filename+".c",null,new File(path));
			String line=null; 
            String true_result="";
            String false_result="";
            File compile_file = new File(path+"/"+filename+"_compile.txt");
            if(!compile_file.exists()) compile_file.createNewFile();
            PrintStream ps = new PrintStream(new FileOutputStream(compile_file));
			
			if(process!=null){
				//取得命令结果的输出流    
	             InputStream fis=process.getInputStream();    
	            //用一个读输出流类去读    
	             InputStreamReader isr=new InputStreamReader(fis);    
	            //用缓冲器读行    
	             BufferedReader br=new BufferedReader(isr); 
	             
	             BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));
	             
	            //直到读完为止    
	            while((line=br.readLine())!=null)    
	             {    
	                 //System.out.println(line);
	                 true_result=true_result+"<br />"+line;
	             }   
	            while ((line = stdError.readLine()) != null) {
	            	//System.out.println(line);
	            	false_result =false_result+line+"<br />";
	            	ps.append(line+"\r\n");
	            }
	            ps.close();
	            br.close();
	            stdError.close();
			}
			process.waitFor();
			process.destroy();
			if(false_result!="")
			{
				//System.out.println(false_result);
				message = "编译报错<br />"+false_result;
			}
			else{
				message =new CodeRun().codeRun("R"+filename, path,filename,tikunum);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return message;
	}

}
