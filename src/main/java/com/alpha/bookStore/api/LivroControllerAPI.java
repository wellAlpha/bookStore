package com.alpha.bookStore.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.repositories.LivroRepository;

@RestController
@RequestMapping("/api/bookstore/admin/livro")
public class LivroControllerAPI {
	@Autowired
	LivroRepository livroRepository;
	@GetMapping("/list")
	public List<Livro> list (){
		return livroRepository.findAll();
	}
	
	@PostMapping("/create")
	public Livro create(@RequestBody Livro livro) {
		return livroRepository.save(livro);
	}
	
	@PutMapping("/update")
	public Livro update(@RequestBody Livro livro) {
		return livroRepository.save(livro);
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		var livro = livroRepository.findById(id).get();
		
		livro.setAtivo(false);
		livro.setDestaque(false);
		
		livroRepository.save(livro);
	}
}
