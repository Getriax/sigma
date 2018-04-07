package com.sigma.controller;

import java.util.ArrayList;
import java.util.List;

import com.sigma.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sigma.model.Carbon;
import com.sigma.model.Fertilizer;
import com.sigma.model.Product;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Nikodem
 *
 */
@Controller
@RequestMapping("/")
public class MainController 
{
	private static final Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	ProductsDAOimpl products;
	@Autowired
	GroupsDAOimpl groups;
	@Autowired
	DbxService dbx;
	@Autowired
	MailService mailService;
	@Autowired
	FileManagerService fileManagerService;
	
	@RequestMapping({"/sigma", "/"})
	public String home()
	{
		return "home";
	}
	@RequestMapping(value = "/nawozy", method = RequestMethod.GET)
	public String fertilizers(Model model, @RequestParam(value = "sort", required=false) Integer groupId)
	{
		List<Fertilizer> items = new ArrayList<>();
		products.getFertilizersAll().forEach(el -> items.add(el));
		if (groupId != null && groupId > 0)
		{
			items.removeIf(item -> item.getGroup().getId() != groupId);
			//items.sort((elo,elt) -> {if (elo.getGroup().getId() == groupId) return -1; else return 1;});
		}
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(el.getMainImg()));
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "nawoz");
		model.addAttribute("title", "nawozy");
		model.addAttribute("sort", "nawozy?sort=");
		model.addAttribute("groups", groups.getFertilizeGroupAll());
		model.addAttribute("productId", 1);
		return "products";
	}
	@RequestMapping(value = "/opal", method = RequestMethod.GET)
	public String carbons(Model model, @RequestParam(value = "sort", required=false) Integer groupId)
	{
		List<Carbon> items = new ArrayList<>();
		products.getCarbonsAll().forEach(el -> items.add(el));
		if (groupId != null && groupId > 0)
		{
			items.removeIf(item -> item.getGroup().getId() != groupId);
			//items.sort((elo,elt) -> {if (elo.getGroup().getId() == groupId) return -1; else return 1;});
		}
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(el.getMainImg()));
		
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "opal");
		model.addAttribute("title", "opal");
		model.addAttribute("sort", "opal?sort=");
		model.addAttribute("groups", groups.getCarbonGroupAll());
		model.addAttribute("productId", 2);
		return "products";
	}
	@RequestMapping(value = "/inne", method = RequestMethod.GET)
	public String others(Model model, @RequestParam(value = "sort", required=false) Integer groupId)
	{
		List<Product> items = new ArrayList<>();
		products.getProductsAll().forEach(el -> items.add(el));
		
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(el.getMainImg()));
		
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "inne");
		model.addAttribute("title", "inne");
		model.addAttribute("gname", "inne");
		model.addAttribute("productId", 3);
		return "products";
	}
	@RequestMapping("/nawoz-{id}")
	public String fertilizer(@PathVariable("id") Integer id, Model model)
	{
		String mainImg = null;
		Fertilizer fer = products.getFertilizerById(id);
		if (!fer.getMainImg().isEmpty())
		mainImg = fer.getMainImg();
		List<String> imgs = new ArrayList<>();
		fer.getImgs().forEach(el -> imgs.add(el));
		
		model.addAttribute("productId", 1);
		model.addAttribute("item", fer);
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		return "product";
	}
	@RequestMapping("/opal-{id}")
	public String carbon(@PathVariable("id") Integer id, Model model)
	{
		String mainImg = null;
		Carbon car = products.getCarbonById(id);
		if (!car.getMainImg().isEmpty())
		mainImg = car.getMainImg();
		List<String> imgs = new ArrayList<>();
		car.getImgs().forEach(el -> imgs.add(el));
		
		model.addAttribute("productId", 2);
		model.addAttribute("item", car);
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		return "product";
	}
	@RequestMapping("/inne-{id}")
	public String other(@PathVariable("id") Integer id, Model model)
	{
		String mainImg = null;
		Product pro = products.getProductById(id);
		if (!pro.getMainImg().isEmpty())
		mainImg = pro.getMainImg();
		List<String> imgs = new ArrayList<>();
		pro.getImgs().forEach(el -> imgs.add(el));
		
		model.addAttribute("productId", 3);
		model.addAttribute("item", pro);
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		return "product";
	}
	@RequestMapping("/wiadomosc")
	public String message(@RequestParam("imie") String imie, @RequestParam("email") String email, @RequestParam("text") String text)
	{
		logger.info("Sending message form " + imie + " " + email);
		mailService.sendSimpleMessage(imie, text, email);
		return "redirect:/sigma/#cost";
	}
}
