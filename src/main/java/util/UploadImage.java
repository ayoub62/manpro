package util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import entities.User;
import metier.Imetier;


public class UploadImage {
	public static void addImage(HttpServletRequest req, HttpSession session) {
		
		@SuppressWarnings("resource")
		Imetier metier = (Imetier) new ClassPathXmlApplicationContext("applicationContext.xml").getBean("metier"); 
		
		System.out.println("invoked 2");
		Part part = null;
		String nomFichier = null;
		String extention = null;
		String destination = "C:/Users/AAL/Desktop/JEE/manpro/src/main/webapp/res/images/userPdp/";
		User user = (User) session.getAttribute("user");
		String pdpUrl = user.getPdpURL();
		
		try{
			part = req.getPart("fichier");
			nomFichier = getFileName(part);
			System.out.println(nomFichier);
		}catch(Exception e){
			System.out.println("Erreur pendant l'uplaod");
		}
//		user.getUserId()+GetRandomValue.getValue()+"."+extention+""
		extention = nomFichier.split("\\.")[1];
		user.setPdpURL(user.getUserId()+new Date().getTime()+Math.random()+"."+extention);
		metier.updateUser(user);
		session.setAttribute("user", user);
		Path path = Paths.get(destination+pdpUrl);
		try{
			if(!path.endsWith("default.jpg"))
				Files.deleteIfExists(path);
		}catch(Exception e){
			System.out.println("not found");
		}
		try{
			BufferedInputStream in = new BufferedInputStream(part.getInputStream(),10240);
			BufferedOutputStream out = new BufferedOutputStream( new FileOutputStream( new File( destination + user.getPdpURL()) ),10240 );
			byte[] tampon = new byte[10240];
			int longueur;
			while ( ( longueur = in.read( tampon ) ) > 0 ) {
	            out.write( tampon, 0, longueur );
	        }
			in.close();
			out.close();
		}catch(Exception e){
			System.out.println("Erreur 2");
		}	
	}

	private static String getFileName(Part part) {
		for(String str: part.getHeader("content-disposition").split(";")){
			if(str.trim().startsWith("filename")){
				return str.substring(str.indexOf("=")+1).trim().replace("\"", "");
			}
		}
		return null;
	}
}