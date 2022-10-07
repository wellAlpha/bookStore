package com.alpha.bookStore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.repositories.CategoriaRepository;

@Controller
public class CategoriaController {
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@GetMapping("admin/categoria")
	public ModelAndView getAll() {
		ModelAndView modelAndView = new ModelAndView("admin/categoria");
		var categorias = categoriaRepository.findAll();
		
		modelAndView.addObject("categorias", categorias);
		
		//modelAndView.setViewName();
		return modelAndView;
		
	}
}
