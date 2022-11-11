package com.alpha.bookStore.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.bookStore.entities.Autor;
import com.alpha.bookStore.repositories.AutorRepository;

@RestController
@RequestMapping("/api/bookstore/admin/autor")
public class AutorControllerAPI {
	@Autowired
	AutorRepository autorRepository;
	
	@GetMapping("/list")
	public List<Autor> list(){
		return autorRepository.findAll();
	}
}
