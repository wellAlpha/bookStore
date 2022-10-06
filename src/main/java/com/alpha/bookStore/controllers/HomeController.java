package com.alpha.bookStore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView modelAndView) {
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
}
