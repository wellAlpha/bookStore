package com.alpha.bookStore.entities;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Autor {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@NotBlank
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private Boolean ativo = true;

	public Autor(Integer id, String nome, Boolean ativo) {
		this.id = id;
		this.nome = nome;
		this.ativo = ativo;
	}

	public Autor(String nome) {

		this.nome = nome;

	}

	public Autor() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

}
