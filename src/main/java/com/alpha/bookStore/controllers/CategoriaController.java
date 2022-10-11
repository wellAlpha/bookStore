package com.alpha.bookStore.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.entities.Categoria;
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
		
		return modelAndView;
		
	}

	
	@GetMapping("/admin/categoria/create")
	public ModelAndView createCategoria(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		
		return modelAndView;
	}
	@PostMapping("/admin/categoria/create")
	public ModelAndView createCategoriaPost(@Valid Categoria categoria, BindingResult errors) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");
		if(errors.hasErrors())
			return createCategoria(categoria);
		
		categoriaRepository.save(categoria);
		return modelAndView;
	}
	
	@GetMapping("/admin/categoria/edit")
	public ModelAndView editCategoria(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		
		return modelAndView;
	}
	
	@PostMapping("/admin/categoria/edit")
	public ModelAndView editCategoriaPost(@Valid Categoria categoria, BindingResult errors) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");
		
		if(errors.hasErrors())
			return editCategoria(categoria);
		
		return modelAndView;
	}
}
