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

import com.alpha.bookStore.entities.Autor;
import com.alpha.bookStore.repositories.AutorRepository;

@Controller
public class AutorController {
	
	@Autowired
	AutorRepository autorRepository;
	
	@GetMapping("admin/autor")
	public ModelAndView getAll() {
		ModelAndView modelAndView = new ModelAndView("admin/autor");
		var autor = autorRepository.findAll();
		
		modelAndView.addObject("autor", autor);
		
		return modelAndView;
		
	}

	
	@GetMapping("/admin/autor/create")
	public ModelAndView createAutor(Autor autor) {
		ModelAndView modelAndView = new ModelAndView("admin/formAutor");
		
		return modelAndView;
	}
	@PostMapping("/admin/autor/create")
	public ModelAndView createAutorPost(@Valid Autor autor, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/autor");
		if(errors.hasErrors())
			return createAutor(autor);
		
		autorRepository.save(autor);
		
		redirectAttributes.addFlashAttribute("msg", "Salvo com sucesso!");
		return modelAndView;
	}
	
	@GetMapping("/admin/autor/edit/{id}")
	public ModelAndView editAutor(@PathVariable Integer id, Autor autor) {
		ModelAndView modelAndView = new ModelAndView("admin/formAutor");
		
		var autorReg = autorRepository.findById(id).get();
		
		modelAndView.addObject("aut", autorReg);
		
		return modelAndView;
	}
	
	@PostMapping("/admin/autor/edit")
	public ModelAndView autorPost(@Valid Autor autor, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/autor");
		
		if(errors.hasErrors())
			return editAutor(autor.getId(), autor);
		
		var autorReg = autorRepository.findById(autor.getId()).get();
		
		autorReg.setNome(autor.getNome());
		
		autorRepository.save(autorReg);
		
		redirectAttributes.addFlashAttribute("msg", "Editado com sucesso!");

		return modelAndView;
	}
	
	@GetMapping("/admin/autor/ativacao/{id}")
	public ModelAndView ativacaoAutor(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/autor");
		var autorReg = autorRepository.findById(id).get();
		autorReg.setAtivo(!autorReg.getAtivo());
		autorRepository.save(autorReg);
		redirectAttributes.addFlashAttribute("msg", (autorReg.getAtivo() ? "Ativado com sucesso!" : "Desativado com sucesso!"));
		return modelAndView;
	}
}
