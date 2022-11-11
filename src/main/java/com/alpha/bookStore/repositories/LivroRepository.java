package com.alpha.bookStore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Autor;
import com.alpha.bookStore.entities.Livro;



public interface LivroRepository extends JpaRepository<Livro, Integer> {
	List<Livro> findByDestaqueTrue();
	List<Livro> findByAutor(Autor autor);
	List<Livro> findByTituloContainingIgnoreCase(String nome);
	
}
