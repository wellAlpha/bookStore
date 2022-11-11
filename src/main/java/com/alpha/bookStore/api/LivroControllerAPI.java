package com.alpha.bookStore.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.repositories.LivroRepository;

@RestController
@RequestMapping("/api/bookstore")
public class LivroControllerAPI {
	@Autowired
	LivroRepository livroRepository;
	@GetMapping("/livros")
	public List<Livro> list (){
		return livroRepository.findAll();
	}
	
	@PostMapping
	public Livro create(@RequestBody Livro body) {
		return livroRepository.save(body);
	}
}
