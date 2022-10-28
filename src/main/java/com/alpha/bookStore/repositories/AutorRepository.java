package com.alpha.bookStore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Autor;

public interface AutorRepository extends JpaRepository<Autor, Integer> {

	List<Autor> findByAtivoTrue();

}
