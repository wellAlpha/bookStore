package com.alpha.bookStore.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
