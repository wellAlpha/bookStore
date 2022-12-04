package com.alpha.bookStore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Autor;
import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.entities.Editora;
import com.alpha.bookStore.entities.Livro;



public interface LivroRepository extends JpaRepository<Livro, Integer> {
	List<Livro> findByDestaqueTrue();
	List<Livro> findByTituloContainingIgnoreCase(String nome);
	List<Livro> findByAutor(Autor autor);
	List<Livro> findByEditora(Editora editora);
	List<Livro> findByCategoria(Categoria categoria);
	
}
