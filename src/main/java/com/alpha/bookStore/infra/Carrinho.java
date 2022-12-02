package com.alpha.bookStore.infra;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
// import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.alpha.bookStore.entities.Livro;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Carrinho {
	Map<Livro, Integer> cart = new LinkedHashMap<>();

	public Collection<Livro> getLivros() {
		return cart.keySet();
	}

	public void add(Livro livro) {
		cart.put(livro, searchBookQtdCart(livro));
	}

	public Integer searchBookQtdCart(Livro livro) {
		if (!cart.containsKey(livro))
			return 1;
		else
			return cart.get(livro) + 1;

	}
	
	public Integer getTotalPorLivro(Livro livro) {
		if (!cart.containsKey(livro))
			return 1;
		else
			return cart.get(livro);

	}
	public BigDecimal getTotalPrecoPorLivro(Livro livro) {
		return livro.getPreco().multiply(BigDecimal.valueOf(getTotalPorLivro(livro)));

	}
	
	public BigDecimal getSubTotal() {
		BigDecimal total = BigDecimal.ZERO;
		for (Livro liv : cart.keySet()) {
			total = total.add(getTotalPrecoPorLivro(liv));
			
		}
		return total;

	}

	public void remove(Livro livro) {
		cart.remove(livro);
	}
	public void clear() {
		cart.clear();
	}
	
	public void update(Livro livro, Integer qtd) {
		cart.put(livro, qtd);
	}
}
