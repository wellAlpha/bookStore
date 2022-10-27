package com.alpha.bookStore.entities;

import java.math.BigDecimal;

import javax.persistence.*;

@Entity
public class Livro {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(nullable = false)
	private String titulo;

	@Column(nullable = false)
	private Integer paginas;

	@Column(nullable = false)
	private String pathFoto;

	private BigDecimal preco;

	@Column(nullable = false)
	private Boolean destaque;

	@Column(nullable = false)
	private Boolean ativo;

	@OneToOne
	private Autor autor;

	@OneToOne
	private Editora editora;

	@OneToOne
	private Categoria categoria;

	public Livro(Integer id, String titulo, Integer paginas, String pathFoto, BigDecimal preco, Boolean destaque,
			Boolean ativo, Autor autor, Editora editora, Categoria categoria) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.paginas = paginas;
		this.pathFoto = pathFoto;
		this.preco = preco;
		this.destaque = destaque;
		this.ativo = ativo;
		this.autor = autor;
		this.editora = editora;
		this.categoria = categoria;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getPaginas() {
		return paginas;
	}

	public void setPaginas(Integer paginas) {
		this.paginas = paginas;
	}

	public String getPathFoto() {
		return pathFoto;
	}

	public void setPathFoto(String pathFoto) {
		this.pathFoto = pathFoto;
	}

	public BigDecimal getPreco() {
		return preco;
	}

	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}

	public Boolean getDestaque() {
		return destaque;
	}

	public void setDestaque(Boolean destaque) {
		this.destaque = destaque;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Autor getAutor() {
		return autor;
	}

	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	public Editora getEditora() {
		return editora;
	}

	public void setEditora(Editora editora) {
		this.editora = editora;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

}
