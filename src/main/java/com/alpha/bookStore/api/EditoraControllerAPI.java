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

import com.alpha.bookStore.entities.Autor;
import com.alpha.bookStore.entities.Editora;
import com.alpha.bookStore.repositories.AutorRepository;
import com.alpha.bookStore.repositories.EditoraRepository;

@RestController
@RequestMapping("/api/bookstore/admin/editora")
public class EditoraControllerAPI {
	@Autowired
	EditoraRepository editoraRepository;

	@GetMapping("/list")
	public List<Editora> list() {
		return editoraRepository.findAll();
	}

	@PostMapping("/create")
	public Editora create(@RequestBody Editora editora) {
		return editoraRepository.save(editora);
	}

	@PutMapping("/update/{id}")
	public Editora update(@PathVariable Integer id, @RequestBody Editora editora) {
		var oldEditora = editoraRepository.findById(id).get();
		
		oldEditora.setDescricao(editora.getDescricao());
		
		return editoraRepository.save(oldEditora);
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		var editora = editoraRepository.findById(id).get();

		editora.setAtivo(false);
		
		editoraRepository.save(editora);
	}
}
