package com.alpha.bookStore.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.repositories.LivroRepository;

@Controller
public class LivroController {
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/admin/livros")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("admin/livros");
		
		var livros = livroRepository.findAll();
		
		modelAndView.addObject("livros", livros);
		return modelAndView;
	}
	
	@GetMapping("/admin/livros/create")
	public ModelAndView form(Livro livro) {
		ModelAndView modelAndView = new ModelAndView("admin/livros/create");
		
		var livros = livroRepository.findAll();
		
		modelAndView.addObject("livros", livros);
		
		return modelAndView;
	}
	
	@PostMapping("/admin/livros/create")
	public ModelAndView create(@Valid Livro livro, BindingResult errors) {
		ModelAndView modelAndView = new ModelAndView("admin/livros");
		
		var livros = livroRepository.findAll();
		
		modelAndView.addObject("livros", livros);
		return modelAndView;
	}
}
