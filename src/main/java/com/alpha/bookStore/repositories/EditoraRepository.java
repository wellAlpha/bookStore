package com.alpha.bookStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.entities.Editora;

public interface EditoraRepository extends JpaRepository<Editora, Integer> {

}
