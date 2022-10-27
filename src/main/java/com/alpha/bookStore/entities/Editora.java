package com.alpha.bookStore.entities;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Editora {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@NotBlank
	@Column(nullable = false)
	private String descricao;
	
	@Column(nullable = false)
	private Boolean ativo = true;

	public Editora(Integer id, String descricao, Boolean ativo) {
		this.id = id;
		this.descricao = descricao;
		this.ativo = ativo;
	}

	public Editora(String descricao) {

		this.descricao = descricao;

	}

	public Editora() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

}
