package com.alpha.bookStore.controllers;

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
import com.alpha.bookStore.repositories.AutorRepository;
import com.alpha.bookStore.repositories.CategoriaRepository;
import com.alpha.bookStore.repositories.EditoraRepository;
import com.alpha.bookStore.repositories.LivroRepository;

@Controller
public class HomeController {
	@Autowired
	CategoriaRepository catogoriaRepository;
	@Autowired
	AutorRepository autoRepository;
	@Autowired 
	EditoraRepository editoraRepository;
	@Autowired
	LivroRepository livroRepository;
	
	
	@GetMapping("/")
	public ModelAndView index(ModelAndView modelAndView, Livro livro) {
		modelAndView.setViewName("index");
		
		var categorias = catogoriaRepository.findByAtivoTrue();
		var autores = autoRepository.findByAtivoTrue();
		var editoras = editoraRepository.findByAtivoTrue();
		var livros = livroRepository.findByDestaqueTrue();
		
		modelAndView.addObject("categorias", categorias);
		modelAndView.addObject("autores", autores);
		modelAndView.addObject("editoras", editoras);
		modelAndView.addObject("livros", livros);
		
		return modelAndView;
	}
	@GetMapping("/{id}")
	public ModelAndView buscarLivroPorAutor(@PathVariable Integer id, Livro livro) {
		ModelAndView modelAndView = new ModelAndView("index");
		
		var autor = autoRepository.findById(id).get();
		
		var livros = livroRepository.findByAutor(autor);
		var autores = autoRepository.findByAtivoTrue();
		
		modelAndView.addObject("autores", autores);
		
		modelAndView.addObject("autores", autores);
		modelAndView.addObject("livros", livros);
		
		return modelAndView;
	}
	
	@PostMapping("/busca")
	public ModelAndView barraDeBusca(Livro livro) {
		ModelAndView modelAndView = new ModelAndView("index");
		
		var livros = livroRepository.findByTituloContainingIgnoreCase(livro.getTitulo());
		var autores = autoRepository.findByAtivoTrue();
		
		modelAndView.addObject("autores", autores);
		modelAndView.addObject("livros", livros);
		
		return modelAndView;
	}
	
	@GetMapping("/destalhes/livro/{id}")
	public ModelAndView detalhesLivro(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("index");
		
		return modelAndView;
	}
	
}
