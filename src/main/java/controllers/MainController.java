package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import entities.User;
import metier.Imetier;
import util.UploadImage;

@Controller
public class MainController {
	
	@Autowired
	private Imetier metier;
	
	@RequestMapping("/")
	String welcome(){
		return "index";
	}
	
	@RequestMapping("/signUp")
	String signUp(Model model){
		model.addAttribute("user", new User());
		return "signUp";
	}
	
	@RequestMapping("/logIn")
	String logIn(){
		return "logIn";
	}
	@RequestMapping(path="/logIn",method=RequestMethod.POST)
	String logInPost(HttpServletRequest request,Model model,HttpSession session){
		String pseudo = request.getParameter("pseudo");
		String motdepasse = request.getParameter("motdepasse");
		if(metier.userExist(pseudo, motdepasse) == 0L)
			return "logIn";
		else{
			User user = metier.getUserById(metier.userExist(pseudo, motdepasse));
			session.setAttribute("user", user);
			session.setAttribute("active", true);
			model.addAttribute("user",session.getAttribute("user"));
			return "admin";
		}
	}
	@RequestMapping(path="/signUp",method=RequestMethod.POST)
	String add(@ModelAttribute User user){
		this.metier.addUser(user);
		return "signUp";
	}
	
	@RequestMapping(path="/emailExist",method=RequestMethod.GET)
	@ResponseBody
	public String mailExist(@RequestParam("email") String email){
		System.out.println("ca marche le AJAX");
		if(metier.findEmail(email)){
			return "true";
		}
		else{
			return "false";
		}
	}
	
	@RequestMapping("/pseudoExist")
	@ResponseBody
	public String pseudoExist(@RequestParam("pseudo") String pseudo){
		System.out.println("pseudo looking");
		if(metier.findPseudo(pseudo)){
			System.out.println(pseudo+" lgaah");
			return "true";
		}
			
		else{
			System.out.println(pseudo+" malgahch");
			return "false";
		}	
	}
	
	@RequestMapping("/admin")
	public String goAdmin(HttpSession session,Model model){
		if(session.getAttribute("active") != null){
			model.addAttribute("user",session.getAttribute("user"));
			return "admin";
		}
		else{
			return "logIn";
		}
	}
	@RequestMapping("/upload")
	public String uploadGet(){
		return "upload";
	}
	
	@RequestMapping(path="/upload",method=RequestMethod.POST)
	public String upload(HttpServletRequest req,HttpSession session){
		
		System.out.println("invoked 1");
		UploadImage.addImage(req,session);
		try{
			Thread.sleep(6000);
		}catch(Exception e){
			System.out.println("sleep erreur");
		}
		return "settings";
	}
	
	@RequestMapping(value="/{pseudo:.+}")
	public void profile(@PathVariable String pseudo){
		System.out.println(pseudo);
		
	}
	@RequestMapping("/settings")
	public String setting(HttpSession session,Model model){
		if(session.getAttribute("active") != null){
			model.addAttribute("user",session.getAttribute("user"));
			return "settings";
		}
		else
			return "logIn";
	}
	
	@RequestMapping("/changeName")
	@ResponseBody
	public void changeName(HttpSession session,@RequestParam("newName") String name){
		System.out.println("ajax change name");
		User user = (User)session.getAttribute("user");
		user.setName(name);
		metier.updateUser(user);
		session.setAttribute("user", user);
	}
	
	@RequestMapping("/changePseudo")
	@ResponseBody
	public void changePseudo(HttpSession session,@RequestParam("newPseudo") String pseudo){
}
	@RequestMapping("/changeEmail")
	@ResponseBody
	public void changeEmail(HttpSession session,@RequestParam("newEmail") String email){
		System.out.println("ajax change Email");
		User user = (User)session.getAttribute("user");
		user.setEmail(email);
		metier.updateUser(user);
		session.setAttribute("user", user);
	}
	
	@RequestMapping("/changeTelephone")
	@ResponseBody
	public void changeTelephone(HttpSession session,@RequestParam("newTelephone") String telephone){
		System.out.println("ajax change Telephone");
		User user = (User)session.getAttribute("user");
		user.setPhoneNumber(telephone);
		metier.updateUser(user);
		session.setAttribute("user", user);
	}
	@RequestMapping("/changeMotDePasse")
	@ResponseBody
	public void changeMotDePasse(HttpSession session,@RequestParam("newMotDePasse") String pass){
		System.out.println("ajax change Mot de passe");
		User user = (User)session.getAttribute("user");
		user.setPassword(pass);
		metier.updateUser(user);
		session.setAttribute("user", user);
	}
	
	@RequestMapping("/getPasswordUser")
	@ResponseBody
	public String getPasswordUser(HttpSession session){
		System.out.println("get password");
		User user = (User) session.getAttribute("user");
		System.out.println(user.getPassword());
		return user.getPassword();
	}
}
