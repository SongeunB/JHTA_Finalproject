package com.jhta.finalproject.joincontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.finalproject.vo.MemberVo;

@Controller
	public class LoginController {

	
	@GetMapping("/login")
	public String login(MemberVo vo,Errors erros,HttpSession httpSession,HttpServletResponse response) throws Exception{
		System.out.println("dd");
		return "/login"; 
		
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (auth != null) {
		new SecurityContextLogoutHandler().logout(request, response, auth);
	}
		return "redirect:/home";
	}
}

	
	

	
