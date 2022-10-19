package com.alpha.bookStore.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alpha.bookStore.entities.Categoria;
import com.alpha.bookStore.repositories.CategoriaRepository;

@Controller
public class CategoriaController {
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@GetMapping("admin/categoria")
	public ModelAndView getAll() {
		ModelAndView modelAndView = new ModelAndView("admin/categoria");
		var categorias = categoriaRepository.findAll();
		
		modelAndView.addObject("categorias", categorias);
		
		return modelAndView;
		
	}

	
	@GetMapping("/admin/categoria/create")
	public ModelAndView createCategoria(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		
		return modelAndView;
	}
	@PostMapping("/admin/categoria/create")
	public ModelAndView createCategoriaPost(@Valid Categoria categoria, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");
		if(errors.hasErrors())
			return createCategoria(categoria);
		
		categoriaRepository.save(categoria);
		
		redirectAttributes.addFlashAttribute("msg", "Salvo com sucesso!");
		return modelAndView;
	}
	
	@GetMapping("/admin/categoria/edit/{id}")
	public ModelAndView editCategoria(@PathVariable Integer id, Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView("admin/formCategoria");
		
		var cat = categoriaRepository.findById(id).get();
		
		modelAndView.addObject("cat", cat);
		
		return modelAndView;
	}
	
	@PostMapping("/admin/categoria/edit")
	public ModelAndView editCategoriaPost(@Valid Categoria categoria, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");
		
		if(errors.hasErrors())
			return editCategoria(categoria.getId(), categoria);
		
		var cat = categoriaRepository.findById(categoria.getId()).get();
		
		cat.setDescricao(categoria.getDescricao());
		
		categoriaRepository.save(cat);
		
		redirectAttributes.addFlashAttribute("msg", "Editado com sucesso!");

		return modelAndView;
	}
	
	@GetMapping("/admin/categoria/ativacao/{id}")
	public ModelAndView ativacaoCategoria(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");
		var cat = categoriaRepository.findById(id).get();
		cat.setAtivo(!cat.getAtivo());
		categoriaRepository.save(cat);
		redirectAttributes.addFlashAttribute("msg", (cat.getAtivo() ? "Ativado com sucesso!" : "Desativado com sucesso!"));
		return modelAndView;
	}
}
