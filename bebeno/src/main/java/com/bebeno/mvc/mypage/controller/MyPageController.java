package com.bebeno.mvc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@GetMapping("/profile")
	public String profile() {
		
		
		return "/mypage/profile";
	}
	
	@GetMapping("/updatePwd")
	public String updatePwd() {
		
		
		return "/mypage/updatePwd";
	}
	
	@GetMapping("/deleteAccount")
	public String deleteAccount() {
		
		
		return "/mypage/deleteAccount";
	}
	
	// -------------------------------------------
	
	@GetMapping("/scrap")
	public String scrap() {
		
		
		return "/mypage/scrap";
	}
	
	// -------------------------------------------
	
	@GetMapping("/cart")
	public String cart() {
		
		
		return "/mypage/cart";
	}
}
