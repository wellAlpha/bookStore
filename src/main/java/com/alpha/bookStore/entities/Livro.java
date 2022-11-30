package com.alpha.bookStore.entities;

import java.math.BigDecimal;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
public class Livro {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotBlank
	@Column(nullable = false)
	private String titulo;
	@NotNull
	@Column(nullable = false)
	private Integer paginas;

	@Column(nullable = true)
	private String pathFoto;
	@NotNull
	private BigDecimal preco;

	@Column(nullable = false)
	private Boolean destaque = false;

	@Column(nullable = false)
	private Boolean ativo = true;

	@OneToOne
	@NotNull
	private Autor autor;

	@OneToOne
	@NotNull
	private Editora editora;

	@OneToOne
	@NotNull
	private Categoria categoria;

	public Livro(String titulo, Integer paginas, String pathFoto, BigDecimal preco, Autor autor, Editora editora,
			Categoria categoria) {

		this.titulo = titulo;
		this.paginas = paginas;
		this.pathFoto = pathFoto;
		this.preco = preco;
		this.destaque = true;
		this.ativo = true;
		this.autor = autor;
		this.editora = editora;
		this.categoria = categoria;
	}

	public Livro() {

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

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Livro other = (Livro) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Livro [id=" + id + ", titulo=" + titulo + ", paginas=" + paginas + ", pathFoto=" + pathFoto + ", preco="
				+ preco + ", destaque=" + destaque + ", ativo=" + ativo + ", autor=" + autor + ", editora=" + editora
				+ ", categoria=" + categoria + "]";
	}
	
	
}
