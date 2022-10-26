package com.alpha.bookStore.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.repositories.AutorRepository;
import com.alpha.bookStore.repositories.CategoriaRepository;
import com.alpha.bookStore.repositories.EditoraRepository;
import com.alpha.bookStore.repositories.LivroRepository;

@Controller
public class LivroController {
	@Autowired
	LivroRepository livroRepository;
	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	AutorRepository autorRepository;
	@Autowired
	EditoraRepository editoraRepository;
	
	
	
	@GetMapping("/admin/livro")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("admin/livros");
		
		var livros = livroRepository.findAll();
		
		modelAndView.addObject("livros", livros);
		return modelAndView;
	}
	
	@GetMapping("/admin/livro/create")
	public ModelAndView form(Livro livro) {
		ModelAndView modelAndView = new ModelAndView("admin/formLivro");
		
		var categorias = categoriaRepository.findAll();
		var editoras = editoraRepository.findAll();
		var autores = autorRepository.findAll();
		
		modelAndView.addObject("categorias", categorias);
		modelAndView.addObject("editoras", editoras);
		modelAndView.addObject("autores", autores);
		
		return modelAndView;
	}
	
	@PostMapping("/admin/livro/create")
	public ModelAndView create(@Valid Livro livro, BindingResult errors) {
		ModelAndView modelAndView = new ModelAndView("admin/livros");
		
		if(errors.hasErrors())
			return form(livro);
		
		return modelAndView;
	}
}
