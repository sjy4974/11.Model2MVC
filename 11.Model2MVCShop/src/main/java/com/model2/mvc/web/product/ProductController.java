package com.model2.mvc.web.product;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
//	@RequestMapping("/addProductView.do")
	@RequestMapping( value="addProduct", method=RequestMethod.GET)
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
//	@RequestMapping("/addProduct.do")
	@RequestMapping( value="addProduct", method=RequestMethod.POST)
	public String addProduct( @RequestParam("fileName1") MultipartFile f ,
							@ModelAttribute("product") Product product,
							HttpServletRequest request) throws Exception {
		
		System.out.println("/product/addProduct : POST");
		
		
		String originalFile = f.getOriginalFilename();
        //파일명 중 확장자만 추출                                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
        String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
        
        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
        
        File file = new File(request.getServletContext().getRealPath("/images/uploadFiles")+"/"+storedFileName);
		System.out.println(file);
		f.transferTo(file);
        

		//Business Logic
		product.setFileName(storedFileName);
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
//	@RequestMapping("/getProduct.do")
	@RequestMapping( value="getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/product/getProduct");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		CookieGenerator cookie = new CookieGenerator();
		cookie.setCookieName("history"+URLEncoder.encode(product.getProdName(), "UTF-8"));
		cookie.addCookie(response, request.getParameter("prodNo"));
		
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
//	@RequestMapping("/updateProductView.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.GET)
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
//	@RequestMapping("/updateProduct.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
	}
	

//	@RequestMapping("/listProduct.do")
	@RequestMapping( value="listProduct")
	public String listUser( @ModelAttribute("search") Search search , Model model,
							@RequestParam("menu") String menu) throws Exception{
		
		System.out.println("/product/listProduct : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}
}