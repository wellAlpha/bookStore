package com.alpha.bookStore.controllers;

import javax.servlet.annotation.MultipartConfig;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

		var categorias = categoriaRepository.findByAtivoTrue();
		var editoras = editoraRepository.findByAtivoTrue();
		var autores = autorRepository.findByAtivoTrue();

		modelAndView.addObject("categorias", categorias);
		modelAndView.addObject("editoras", editoras);
		modelAndView.addObject("autores", autores);

		return modelAndView;
	}

	// @InitBinder /* Converts empty strings into null when a form is submitted */
	// public void initBinder(WebDataBinder binder) {
	// binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	// }

	@PostMapping("/admin/livro/create")
	public ModelAndView create(@Valid Livro livro, BindingResult errors /*, MultipartFile file*/) {
		ModelAndView modelAndView = new ModelAndView("admin/livros");
		
		/*if (!file.isEmpty()) {

		}*/
		
		if (errors.hasErrors())
			return form(livro);

		livroRepository.save(livro);

		return modelAndView;
	}
}
