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

import com.alpha.bookStore.entities.Editora;
import com.alpha.bookStore.repositories.EditoraRepository;

@Controller
public class EditoraController {
	@Autowired
	EditoraRepository editoraRepository;
	
	@GetMapping("admin/editora")
	public ModelAndView getAll() {
		ModelAndView modelAndView = new ModelAndView("admin/editora");
		var editoras = editoraRepository.findAll();
		
		modelAndView.addObject("editoras", editoras);
		
		return modelAndView;
		
	}

	
	@GetMapping("/admin/editora/create")
	public ModelAndView createEditora(Editora editora) {
		ModelAndView modelAndView = new ModelAndView("admin/formEditora");
		
		return modelAndView;
	}
	@PostMapping("/admin/editora/create")
	public ModelAndView createEditoraPost(@Valid Editora editora, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/editora");
		if(errors.hasErrors())
			return createEditora(editora);
		
		editoraRepository.save(editora);
		
		redirectAttributes.addFlashAttribute("msg", "Salvo com sucesso!");
		return modelAndView;
	}
	
	@GetMapping("/admin/editora/edit/{id}")
	public ModelAndView editEditora(@PathVariable Integer id, Editora editora) {
		ModelAndView modelAndView = new ModelAndView("admin/formEditora");
		
		var editoraReg = editoraRepository.findById(id).get();
		
		modelAndView.addObject("edit", editoraReg);
		
		return modelAndView;
	}
	
	@PostMapping("/admin/editora/edit")
	public ModelAndView editEditoraPost(@Valid Editora editora, BindingResult errors, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/editora");
		
		if(errors.hasErrors())
			return editEditora(editora.getId(), editora);
		
		var editoraReg = editoraRepository.findById(editora.getId()).get();
		
		editora.setDescricao(editora.getDescricao());
		
		editoraRepository.save(editoraReg);
		
		redirectAttributes.addFlashAttribute("msg", "Editado com sucesso!");

		return modelAndView;
	}
	
	@GetMapping("/admin/editora/ativacao/{id}")
	public ModelAndView ativacaoEditora(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/editora");
		var editoraReg = editoraRepository.findById(id).get();
		editoraReg.setAtivo(!editoraReg.getAtivo());
		editoraRepository.save(editoraReg);
		redirectAttributes.addFlashAttribute("msg", (editoraReg.getAtivo() ? "Ativado com sucesso!" : "Desativado com sucesso!"));
		return modelAndView;
	}
}
