package com.alpha.bookStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Livro;



public interface LivroRepository extends JpaRepository<Livro, Integer> {

}
