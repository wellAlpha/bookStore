package com.alpha.bookStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Autor;

public interface AutorRepository extends JpaRepository<Autor, Integer> {

}
