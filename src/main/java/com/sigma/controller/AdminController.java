package com.sigma.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sigma.service.FileManagerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sigma.model.Carbon;
import com.sigma.model.Fertilizer;
import com.sigma.model.Product;
import com.sigma.service.DbxService;
import com.sigma.service.GroupsDAOimpl;
import com.sigma.service.ProductsDAOimpl;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	private static final Logger logger = Logger.getLogger(AdminController.class);
	@Autowired
	ProductsDAOimpl products;
	@Autowired
	GroupsDAOimpl groups;
	@Autowired
	DbxService dbx;
	@Autowired
	FileManagerService fileManagerService;
	
	
	/**
	 * login to admin panel
	 * @param error if an error shows the message at the site
	 * @param logout if logout shows the message at the site
	 * @param model 
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false, defaultValue = "false") Boolean error,@RequestParam(value = "logout", required = false, defaultValue = "false") Boolean logout, Model model)
	{
		model.addAttribute("logout", logout);
		model.addAttribute("error", error);
		return "login";
	}
	@RequestMapping("/perform_login")
	public String perform_login()
	{
		return "panel";
	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/admin/login?logout=true";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	@RequestMapping("/panel")
	public String panel()
	{
		return "panel";
	}
	@RequestMapping(value = "/panel-nawozy", method = RequestMethod.GET)
	public String panelFertilizers(Model model, @RequestParam(value = "sort", required=false) Integer groupId)
	{
		List<Fertilizer> items = new ArrayList<>();
		products.getFertilizersAll().forEach(el -> items.add(el));
		if (groupId != null && groupId > 0)
		{
			items.sort((elo,elt) -> {if (elo.getGroup().getId() == groupId) return -1; else return 1;});
		}
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(dbx.getFile(el.getMainImg())));
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "dodaj-nawoz");
		model.addAttribute("title", "nawozy");
		model.addAttribute("edit", "nawoz");
		model.addAttribute("delete", "usun-nawoz");
		model.addAttribute("dodaj", "Dodaj naw�z");
		model.addAttribute("page", "panel-nawozy?sort=");
		model.addAttribute("groups", groups.getFertilizeGroupAll());
		
		return "panel_detail";
	}
	@RequestMapping("/panel-opal")
	public String panelCarbons(Model model, @RequestParam(value = "sort", required=false) Integer groupId)
	{
		List<Carbon> items = new ArrayList<>();
		products.getCarbonsAll().forEach(el -> items.add(el));
		if (groupId != null && groupId > 0)
		{
			items.sort((elo,elt) -> {if (elo.getGroup().getId() == groupId) return -1; else return 1;});
		}
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(dbx.getFile(el.getMainImg())));
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "dodaj-opal");
		model.addAttribute("title", "opa�");
		model.addAttribute("edit", "opal");
		model.addAttribute("delete", "usun-opal");
		model.addAttribute("dodaj", "Dodaj opa�");
		model.addAttribute("page", "panel-opal?sort=");
		model.addAttribute("groups", groups.getCarbonGroupAll());
		return "panel_detail";
	}
	@RequestMapping("/panel-produkty")
	public String panelProducts(Model model)
	{
		List<Product> items = new ArrayList<>();
		products.getProductsAll().forEach(el -> items.add(el));
		List<String> imgs = new ArrayList<>();
		items.forEach(el -> imgs.add(dbx.getFile(el.getMainImg())));
		model.addAttribute("items", items);
		model.addAttribute("imgs", imgs);
		model.addAttribute("link", "dodaj-produkt");
		model.addAttribute("title", "produkty");
		model.addAttribute("edit", "produkt");
		model.addAttribute("dodaj", "Dodaj inne");
		model.addAttribute("delete", "usun-produkt");
		model.addAttribute("gname", "Inne");
		return "panel_detail";
	}
//	@RequestMapping("/panel-wszystko")
//	public String panelAll(Model model)
//	{
//		List<com.sigma.adds.Product> items = new ArrayList<>();
//		products.getFertilizersAll().forEach(el -> items.add(el));
//		products.getCarbonsAll().forEach(el -> items.add(el));
//		products.getProductsAll().forEach(el -> items.add(el));
//		List<String> imgs = new ArrayList<>();
//		items.forEach(el -> imgs.add(dbx.getFile(el.getMainImg())));
//		model.addAttribute("items", items);
//		model.addAttribute("imgs", imgs);
//		model.addAttribute("title", "wszystko");
//		return "panel_detail";
//	}
	@RequestMapping("/dodaj-nawoz")
	public String addFertilizer(@ModelAttribute("fertilizer") Fertilizer fertilizer, Model model)
	{
		model.addAttribute("fertilizer", fertilizer);
		model.addAttribute("button", "Dodaj");
		model.addAttribute("groups", groups.getFertilizeGroupAll());
		model.addAttribute("files",new MultipartFile[10]);
		return "addfertilizer";
	}
	@RequestMapping("/dodaj-opal")
	public String addCarbon(@ModelAttribute("carbon") Carbon carbon, Model model)
	{
		model.addAttribute("carbon", carbon);
		model.addAttribute("groups", groups.getCarbonGroupAll());
		model.addAttribute("files",new MultipartFile[10]);
		model.addAttribute("button", "Dodaj");
		return "addcarbon";
	}
	@RequestMapping("/dodaj-produkt")
	public String addProduct(@ModelAttribute("product") Product product, Model model)
	{
		model.addAttribute("product", product);
		model.addAttribute("button", "Dodaj");
		model.addAttribute("files",new MultipartFile[10]);
		return "addproduct";
	}
	@RequestMapping("/nawoz-{id}")
	public String editFertilizer(@PathVariable("id") Integer id, Model model)
	{
		String mainImg = null;
		Fertilizer fer = products.getFertilizerById(id);
		if (!fer.getMainImg().isEmpty())
		mainImg = dbx.getFile(fer.getMainImg());
		List<String> imgs = new ArrayList<>();
		List<String> imgn = new ArrayList<>();
		fer.getImgs().forEach(el -> {imgs.add(dbx.getFile(el)); imgn.add(el);});
		
		model.addAttribute("button", "Zatwierd�");
		model.addAttribute("fertilizer", fer);
		model.addAttribute("groups", groups.getFertilizeGroupAll());
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		model.addAttribute("imgn", imgn);
		return "addfertilizer";
	}
	@RequestMapping("/opal-{id}")
	public String editCarbon(@PathVariable("id") Integer id, Model model)
	{
		Carbon car = products.getCarbonById(id);
		String mainImg = null;
		if (!car.getMainImg().isEmpty())
			mainImg = dbx.getFile(car.getMainImg());
		List<String> imgs = new ArrayList<>();
		List<String> imgn = new ArrayList<>();
		car.getImgs().forEach(el -> {imgs.add(dbx.getFile(el)); imgn.add(el);});
	
		model.addAttribute("button", "Zatwierd�");
		model.addAttribute("carbon", car);
		model.addAttribute("groups", groups.getCarbonGroupAll());
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		model.addAttribute("imgn", imgn);
		return "addcarbon";
	}
	@RequestMapping("/produkt-{id}")
	public String editProduct(@PathVariable("id") Integer id, Model model)
	{
		Product pro = products.getProductById(id);
		String mainImg = null;
		if (!pro.getMainImg().isEmpty())
			mainImg = dbx.getFile(pro.getMainImg());
		List<String> imgs = new ArrayList<>();
		List<String> imgn = new ArrayList<>();
		pro.getImgs().forEach(el -> {imgs.add(dbx.getFile(el)); imgn.add(el);});
	
		model.addAttribute("button", "Zatwierd�");
		model.addAttribute("img", pro.getMainImg());
		model.addAttribute("product", pro);
		model.addAttribute("mainimg", mainImg);
		model.addAttribute("imgs", imgs);
		model.addAttribute("imgn", imgn);
		
		return "addproduct";
	}
	@RequestMapping("/usun-nawoz-{id}")
	public String deleteFertilizer(@PathVariable("id") Integer id)
	{
		Fertilizer fer = products.getFertilizerById(id);
		dbx.deleteFile(fer.getMainImg());
		fileManagerService.deleteFile(fer.getMainImg());
		fer.getImgs().forEach(el -> {dbx.deleteFile(el); fileManagerService.deleteFile(el);});
		products.deleteFertilizer(id);
		return "redirect:/admin/panel-nawozy";
	}
	@RequestMapping("/usun-opal-{id}")
	public String deleteCarbon(@PathVariable("id") Integer id)
	{
		Carbon car = products.getCarbonById(id);
		dbx.deleteFile(car.getMainImg());
		fileManagerService.deleteFile(car.getMainImg());
		car.getImgs().forEach(el -> {dbx.deleteFile(el); fileManagerService.deleteFile(el);});
		products.deleteCarbon(id);
		return "redirect:/admin/panel-opal";
	}
	@RequestMapping("/usun-produkt-{id}")
	public String deleteProduct(@PathVariable("id") Integer id)
	{
		Product pro = products.getProductById(id);
		dbx.deleteFile(pro.getMainImg());
		fileManagerService.deleteFile(pro.getMainImg());
		pro.getImgs().forEach(el -> {dbx.deleteFile(el); fileManagerService.deleteFile(el);});
		products.deleteProduct(id);
		return "redirect:/admin/panel-produkty";
	}
	@RequestMapping(value = "/nawoz-img-usun", method = RequestMethod.GET)
	public String fertilizerDeletePhoto(@RequestParam("file") String filePath, @RequestParam("id") Integer id)
	{
		dbx.deleteFile(filePath);
		fileManagerService.deleteFile(filePath);
		Fertilizer fer = products.getFertilizerById(id);
		fer.getImgs().removeIf(el -> el.equals(filePath));
		products.FertilizerSave(fer);
		return "redirect:/admin/nawoz-"+id;
	}
	@RequestMapping(value = "/opal-img-usun", method = RequestMethod.GET)
	public String carbonDeletePhoto(@RequestParam("file") String filePath, @RequestParam("id") Integer id)
	{
		fileManagerService.deleteFile(filePath);
		dbx.deleteFile(filePath);
		Carbon car = products.getCarbonById(id);
		car.getImgs().removeIf(el -> el.equals(filePath));
		products.CarbonSave(car);
		return "redirect:/admin/opal-"+id;
	}
	@RequestMapping(value = "/produkt-img-usun", method = RequestMethod.GET)
	public String productDeletePhoto(@RequestParam("file") String filePath, @RequestParam("id") Integer id)
	{
		dbx.deleteFile(filePath);
		fileManagerService.deleteFile(filePath);
		Product pro = products.getProductById(id);
		pro.getImgs().removeIf(el -> el.equals(filePath));
		products.ProductSave(pro);
		return "redirect:/admin/produkt-"+id;
	}
	@RequestMapping(value = "/perform-nazwoz", method = RequestMethod.POST)
	public String performFertilizer(@ModelAttribute("fertilizer") Fertilizer fertilizer,@RequestParam("file") MultipartFile file,@RequestParam(value = "files", required=false) MultipartFile[] files, Model model, BindingResult result)
	{

		if (result.hasErrors())
			return "addfertilizer";
		logger.info("B��d 1");
		String fileFolder = "Produkty/Nawozy/";
		if (!file.isEmpty() && !file.getOriginalFilename().isEmpty())
		{
			logger.info("B��d 2");
			String mainFile = "Nawoz" + UUID.randomUUID().toString() + "." + file.getOriginalFilename().split("\\.")[1];
			String filePath = fileFolder + mainFile;
			dbx.uploadFile(file, filePath);
			try {
				fileManagerService.uploadFile(filePath, file.getBytes());
			} catch (IOException e) {
				logger.error("Adding static image failed");
				e.printStackTrace();
			}
			if (!fertilizer.getMainImg().isEmpty()) {
				dbx.deleteFile(fertilizer.getMainImg());
				fileManagerService.deleteFile(fertilizer.getMainImg());
			}

			fertilizer.setMainImg(filePath);
		}
		logger.info("B��d 3");
		Set<String> fileSet = new HashSet<>();
		if (!Arrays.asList(files).isEmpty() && !files[0].isEmpty())
		{
			logger.info("Adding imeges of number: " + files.length);
			Arrays.asList(files).forEach(el -> 
			{
				String name = "Nawoz" + UUID.randomUUID().toString() + "." + el.getOriginalFilename().split("\\.")[1];
				String path = fileFolder + name;
				try {
					fileManagerService.uploadFile(path, el.getBytes());
				} catch (IOException e) {
					logger.error("Adding static image failed");
					e.printStackTrace();
				}
				dbx.uploadFile(el, path);
				fileSet.add(path);
			});
			
		}
		logger.info("B��d 4");
		if (!fertilizer.getImgs().isEmpty())
			fileSet.addAll(fertilizer.getImgs());
		logger.info("B��d 5");
		fertilizer.setImgs(fileSet);
		logger.info("B��d 6");
		products.FertilizerSave(fertilizer);
		return "redirect:/admin/panel";
	}
	@RequestMapping(value = "/perform-opal", method = RequestMethod.POST)
	public String performCarbon(@ModelAttribute("carbon") Carbon carbon, @RequestParam("file") MultipartFile file,@RequestParam(value = "files", required=false) MultipartFile[] files, Model model, BindingResult result)
	{
		if (result.hasErrors())
			return "addcarbon";
		String fileFolder = "Produkty/Opal/";
		if (!file.isEmpty() && !file.getOriginalFilename().isEmpty())
		{
			String mainFile = "opal" + UUID.randomUUID().toString() + "." + file.getOriginalFilename().split("\\.")[1];
			String filePath = fileFolder + mainFile;

			try {
				logger.info("Sciezka: " + filePath + "bytes " + file.getBytes());
				fileManagerService.uploadFile(filePath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			dbx.uploadFile(file, filePath);
			if (!carbon.getMainImg().isEmpty()) {
				fileManagerService.deleteFile(carbon.getMainImg());
				dbx.deleteFile(carbon.getMainImg());
			}

			carbon.setMainImg(filePath);
		}
		Set<String> fileSet = new HashSet<>();
		if (!Arrays.asList(files).isEmpty() && !files[0].isEmpty())
		{
			
			Arrays.asList(files).forEach(el -> 
			{
				logger.info("Zdjecie " + el.getOriginalFilename());
				String name = "opal" + UUID.randomUUID().toString() + "." + el.getOriginalFilename().split("\\.")[1];
				String path = fileFolder + name;
				try {
					fileManagerService.uploadFile(path, el.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
				dbx.uploadFile(el, path);
				fileSet.add(path);
			});
		}
		if (!carbon.getImgs().isEmpty())
				fileSet.addAll(carbon.getImgs());
		
		carbon.setImgs(fileSet);
		products.CarbonSave(carbon);
		return "redirect:/admin/panel";
	}
	@RequestMapping(value = "/perform-produkt", method = RequestMethod.POST)
	public String performProduct(@ModelAttribute("product") Product product,@RequestParam("file") MultipartFile file,@RequestParam(value = "files", required=false) MultipartFile[] files ,Model model, BindingResult result)
	{
		if (result.hasErrors())
			return "addproduct";
		String fileFolder = "/Produkty/Inne/";
		if (!file.isEmpty() && !file.getOriginalFilename().isEmpty())
		{
			String mainFile = "inne" + UUID.randomUUID().toString() + "." + file.getOriginalFilename().split("\\.")[1];
			String filePath = fileFolder + mainFile;
			try {
				fileManagerService.uploadFile(filePath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			dbx.uploadFile(file, filePath);
			if (!product.getMainImg().isEmpty()) {
				dbx.deleteFile(product.getMainImg());
				fileManagerService.deleteFile(product.getMainImg());
			}

			product.setMainImg(filePath);
		}
		Set<String> fileSet = new HashSet<>();
		if (!Arrays.asList(files).isEmpty() && !files[0].isEmpty())
		{
			
			Arrays.asList(files).forEach(el -> 
			{
				String name = "inne" + UUID.randomUUID().toString() + "." + el.getOriginalFilename().split("\\.")[1];
				String path = fileFolder + name;
				try {
					fileManagerService.uploadFile(path, el.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
				dbx.uploadFile(el, path);
				fileSet.add(path);
			});
		}
		if (!product.getImgs().isEmpty())
			fileSet.addAll(product.getImgs());
			
		product.setImgs(fileSet);
		products.ProductSave(product);
		return "redirect:/admin/panel";
	}
}
