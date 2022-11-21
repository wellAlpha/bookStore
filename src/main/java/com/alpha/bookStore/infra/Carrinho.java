package com.alpha.bookStore.infra;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.alpha.bookStore.entities.Livro;
import com.alpha.bookStore.repositories.CategoriaRepository;

@Component
public class Carrinho {
	Map<Livro, Integer> cart = new LinkedHashMap<Livro, Integer>();
	
	public Collection<Livro> getLivros(){
		return cart.keySet();
	}
	
	public void add(Livro livro) {
		cart.put(livro, searchBookQtdCart(livro));
	}
	
	public Integer searchBookQtdCart(Livro livro) {
		if(!cart.containsKey(livro))
			return 1;
		else
			return cart.get(livro) + 1;
			
	}
}
