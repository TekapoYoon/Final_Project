package kh.com.a.arrow;

import java.util.Date;

public class FUpUtil {
	//f=abc.zip => f.indexOf('.') 3
	//f.substring(3) .zip
	//f.substring(0,3) abc
	public static String getNewFile(String f){
		String filename="";
		String fpost="";
		//String fre="";
		
		// busking.mp4
		if(f.indexOf('.')>=0){
			fpost=f.substring(f.indexOf('.')); // mp4
			//fre=f.substring(0,f.indexOf('.'));
			filename=new Date().getTime()+fpost; // 2018/10/27 20:22:24 -> 2018102720:22:24.mp4
		}else{
			filename=new Date().getTime()+".back";
		}
		return filename;
	} 
	public static String getNewFile2(String f){
		String filename="";
		String fpost="";
		String fre="";
		if(f.indexOf('.')>=0){
			fpost=f.substring(f.indexOf('.'));
			fre=f.substring(0,f.indexOf('.'));
			filename=fre+new Date().getTime()+fpost;
		}else{
			filename=f+new Date().getTime()+".back";
		}
		return filename;
	} 
	public static String getNewjpg(String f){
		String filename="";
		String fpost="";
		String fre="";
		if(f.indexOf('.')>=0){
			fpost=f.substring(f.indexOf('.'));
			fre=f.substring(0,f.indexOf('.'));
			filename=fre+fpost;
		}else{
			filename=f+".jpg";
		}
		return filename;
	} 
	
}

/*
	주의점!!
	abc.jpg -> 지정폴더(c:\, hardware)
 	파일이름이 중복되지 않게
 	
 	Data() + "" + .jpg
 	
 	abc.jpg -> abc jpg
 	abc -> 파일명			-> 123123123.jpg
 	jpg -> 확장자명
 	123123123.jpg
 	
 	abc.jpg
*/