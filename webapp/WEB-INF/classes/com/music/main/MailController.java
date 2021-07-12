package com.music.main;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
 // mailSending 코드
  @RequestMapping(value = "/mailSending.go")
  public void mailSending(
		  @RequestParam("id") String id
		  ) {
    String setfrom = "susanso@naver.com";         
    String tomail  = "jinhua.huang@dreamene.com";     // 받는 사람 이메일
    String title   = id+"님이 회원가입 하였습니다.";      // 제목
    String content = id+"님이 회원가입 하였습니다.";;    // 내용
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
  }
//회원가입 이메일 인증
 @GetMapping(value = "/signUpMailSending.go")
 public @ResponseBody Map<String, String> SignUpMailSending(
		  @RequestParam("email") String email
		  ) {
	 Map<String, String> map = new HashMap<String, String>();
   Random rand = new Random();
   String signNum = "";
   for(int i = 1; i<=6;i++) {
	 //0~9 까지 난수 생성
	 String ran = Integer.toString(rand.nextInt(10));
	   //append
	   signNum += ran;
   }
   map.put("num",signNum);
   System.out.println(signNum);
   String setfrom = "susanso@naver.com";         
   String tomail  = email;     // 받는 사람 이메일
   String title   = "AISM 인증 번호입니다.";      // 제목
   String content = "회원님의 인증번호는 ["+signNum+"] 입니다.";   // 내용
  
   try {
     MimeMessage message = mailSender.createMimeMessage();
     MimeMessageHelper messageHelper 
                       = new MimeMessageHelper(message, true, "UTF-8");
     messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
     messageHelper.setTo(tomail);     // 받는사람 이메일
     messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
     messageHelper.setText(content);  // 메일 내용
     
     mailSender.send(message);
   } catch(Exception e){
     System.out.println(e);
   }
   
   return map;
 }
}
