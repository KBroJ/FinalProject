package com.bebeno.mvc.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.vo.Cart;
import com.bebeno.mvc.payment.model.vo.CartList;
import com.bebeno.mvc.payment.model.vo.Order;


@Controller
public class CartController {
	
	
	@Autowired
	private CartService service;
	
	// 장바구니 저장 
	@ResponseBody
	@RequestMapping(value = "/wineView/addCart", method = RequestMethod.POST)
	public Map<String, Integer> addCart(Cart cart, HttpSession session) throws Exception {
		Map<String, Integer> map = new  HashMap<>();
		Member member = (Member)session.getAttribute("loginMember");
		cart.setId(member.getId());
		
		
		map.put("result", service.addCart(cart));

		System.out.println(cart);
		
		
		return map;
			
	}
	// 장바구니 이동
	@RequestMapping(value ="/payment/cart", method = RequestMethod.GET)
	public void getCartList (HttpSession session, Model model) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
	
		String id = member.getId();
		
		List<CartList> cartList = service.cartList(id);
		
		model.addAttribute("cartList", cartList);
	}
	
	// 장바구니 삭제
	@GetMapping("/payment/cart/delete/{cart_id}")
	@ResponseBody
	public void deleteCart(@PathVariable(value= "cart_id")int cart_id) {
		
		service.deleteCart(cart_id);
		
	}
	@PostMapping("/payment/cart/selectDelete")
	public String selectDeleteCart(@RequestParam("selectedArr")int [] selectedArr) {
		
		for(int i = 0; i<selectedArr.length; i++) {
			System.out.println("selectedArr :" + selectedArr[i]);
			service.deleteCart(selectedArr[i]);
		}
		return "redirect:/payment/cart";
	}
	
	@GetMapping("/payment/cart/deleteAll")
	public String deleteAllCart(@SessionAttribute(name="loginMember")Member loginMember) {
		
		service.deleteAllCart(loginMember.getId());
		
		return "redirect:/payment/cart";
		
		
	}
	
	
	
	
}


  
  
  
  
  
  
