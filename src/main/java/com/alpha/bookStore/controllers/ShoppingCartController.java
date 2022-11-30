package com.alpha.bookStore.controllers;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.infra.Carrinho;
import com.alpha.bookStore.repositories.LivroRepository;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ShoppingCartController {
	@Autowired
	Carrinho carrinho;
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/cart/add/{id}")
	public ModelAndView cartAdd(@PathVariable int id, Livro livro) {
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
//		var livros = livroRepository.findByTituloContainingIgnoreCase(livro.getTitulo());
//		var autores = autoRepository.findByAtivoTrue();
		
//		modelAndView.addObject("autores", autores);
//		modelAndView.addObject("livros", livros);
		var livroAdd = livroRepository.findById(id).get();
		
		carrinho.add(livroAdd);
		return modelAndView;
	}
	
	@GetMapping("/cart")
	public ModelAndView cart() {
		ModelAndView modelAndView = new ModelAndView("cart");
		var books = carrinho.getLivros();
		
		modelAndView.addObject("books", books);
		
		return modelAndView;
	}
	
	@GetMapping("/cart/livro/{id}")
	public ModelAndView remove(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
		var books = carrinho.getLivros();
		System.out.println(id);
		var livro = livroRepository.findById(id).get();
		
		if(livro != null)
			carrinho.remove(livro);
		
		modelAndView.addObject("books", books);
		
		return modelAndView;
	}
	
	@PostMapping("/cart/livro/update")
	public ModelAndView update(Integer livroId, Integer quantidade) {
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
		
		carrinho.update(livroRepository.findById(livroId).get(), quantidade);
		
		return modelAndView;
	}
	
	
	
	
}
