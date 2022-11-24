package com.alpha.bookStore.infra;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.alpha.bookStore.entities.Livro;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
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

	public void remove(Livro livro) {
		cart.remove(livro);
	}
}
