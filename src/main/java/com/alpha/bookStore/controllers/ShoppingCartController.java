package com.alpha.bookStore.controllers;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.infra.Carrinho;
import com.alpha.bookStore.repositories.LivroRepository;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ShoppingCartController {
	@Autowired
	Carrinho cart;
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/cart")
	public ModelAndView cart() {
		ModelAndView modelAndView = new ModelAndView("cart");
		var books = cart.getLivros();
		
		modelAndView.addObject("books", books);
		
		return modelAndView;
	}
	
	@GetMapping("/cart/livro/qtd")
	public ModelAndView remove(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
		var books = cart.getLivros();
		
		var livro = livroRepository.findById(id).get();
		
		if(livro != null)
			cart.remove(livro);
		
		modelAndView.addObject("books", books);
		
		return modelAndView;
	}
	
	
	
}
