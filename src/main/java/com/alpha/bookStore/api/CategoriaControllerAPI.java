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
import com.alpha.bookStore.repositories.CategoriaRepository;

@RestController
@RequestMapping("/api/bookstore/admin/categoria")
public class CategoriaControllerAPI {
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@GetMapping("/list")
	public List<Categoria> list() {
		return categoriaRepository.findAll();
	}
	
	@PostMapping("/create")
	public Categoria create(@RequestBody Categoria body) {
		return categoriaRepository.save(body);
	}
	
	@PutMapping("/update/{id}")
	public Categoria update(@PathVariable Integer id, @RequestBody Categoria body)
	{
		var antigaCategoria = categoriaRepository.findById(id).get();
		
		antigaCategoria.setDescricao(body.getDescricao());
		categoriaRepository.save(antigaCategoria);
		return antigaCategoria;
		
		
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id)
	{
		categoriaRepository.deleteById(id);
	}
}
