package aism.com.music.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aism.data.service.AISM_User_Membership_Info_ServiceInter;

@Controller
public class OpenMarketController {
//	@Autowired
//	private AISM_User_Membership_Info_ServiceInter membership;
	
	//내 상품 리스트로 이동
	@GetMapping("myProductList")
	public String myProductList() {
		
		return "/component/market/seller/myProductList";
	}
	
	@GetMapping("productDetail")
	public @ResponseBody ModelAndView productDetail() {
		ModelAndView model = new ModelAndView();
//		System.out.println(qwe123);
//		model.addObject("img", qwe123);
		model.setViewName("/component/market/productDetail");
		return model;
	}
	
	
	
}
