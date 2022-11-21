package com.alpha.bookStore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.infra.Carrinho;

@Controller
public class ShoppingCartController {
	@Autowired
	Carrinho cart;
	
	@GetMapping("/cart")
	public ModelAndView cart() {
		ModelAndView modelAndView = new ModelAndView("cart");
		var books = cart.getLivros();
		
		modelAndView.addObject("books", books);
		
		return modelAndView;
	}
}
