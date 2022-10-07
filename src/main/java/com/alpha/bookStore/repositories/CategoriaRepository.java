package com.alpha.bookStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {

}
