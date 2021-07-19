package aism.com.music.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aism.data.dto.AISM_User_Membership_Info_DTO;
import aism.data.dto.AISM_User_Work_List_DTO;
import aism.data.service.AISM_User_Membership_Info_ServiceInter;

@Controller
public class MemberController {
	
	@Autowired
	private AISM_User_Membership_Info_ServiceInter membership;
	
	//로그인
	@PostMapping("login.go")
	public @ResponseBody HashMap<String, String> loginResult(
			HttpSession session, 
			@RequestParam String id, 
			@RequestParam String pwd
			) {
		HashMap<String, String> map = new HashMap<String, String>();
		boolean checkUser = membership.isCheckPass(id, pwd);
//		System.out.println("checkUser "+ checkUser);
		if(checkUser){
			map.put("path","true");
			String profileImg = membership.findMemberProfileImg(id);
			session.setAttribute("profileImg", profileImg);
			session.setAttribute("myid", id);
			session.setAttribute("loginOK","loginOK");
			membership.loginTime(id);
		}else {
			map.put("path","false");
		}
		return map;
	}
	//로그아웃
	@GetMapping("logout.go")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "/home";
	}
	//회원가입페이지로 이동
	@GetMapping("/signUp.do")
	public String signup() {
			String a = "login/signUp";
		return a;
	}
	//회원 가입
	@GetMapping("signUp.go")
	public @ResponseBody Map<String, String> joinMember(@ModelAttribute AISM_User_Membership_Info_DTO dto,
			@RequestParam("id") String userid ) {
		//userid 로 된 폴더 생성
		Process proc;
		String playPath ="sudo python3 /home/ubuntu/tomcat/webapps/AISM/Make_Membership_Directory.py "+userid;
	    try {
	        proc = Runtime.getRuntime().exec(playPath);
	        BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	        
	        String line = null;
	        while ((line = in.readLine()) != null) {
	            System.out.println(line);
	        }
	        in.close();
	        proc.waitFor();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (InterruptedException e) {
	        e.printStackTrace();
	    }
		Map<String, String> map = new HashMap<String, String>();
		membership.insertMember(dto);
		map.put("id", userid);
		map.put("success", "success");
		return map;
	}
	//아이디 중복확인
	@GetMapping("isCheckIdMember")
	public @ResponseBody int isCheckIdMember(
			@RequestParam("id") String id){
		int check =  membership.isCheckIdMember(id);
		return check;
	}
	//마이페이지 인증 페이지 이동
	@GetMapping("myPageCertification")
	public ModelAndView myPageCertification() {
		ModelAndView model = new ModelAndView();
		model.addObject("userInfo","true");
		model.setViewName("/login/myPageCertification");
		return model;
	}
	//회원정보 보기
	@PostMapping("/selectUserInfo")
	public ModelAndView selectUserInfo(@RequestParam("userName")String userId) {
		System.out.println(" controller 통과 selectUserInfo 지남");
		ModelAndView model = new ModelAndView();
		model.addObject("userInfo",membership.memberInfo(userId));
		model.setViewName("/login/myMainPage");
		return model;
	}
	//마이 페이지 이동
	@PostMapping("mypage")
	public @ResponseBody ModelAndView myPage(@RequestParam("id") String id ,@RequestParam("pwd") String pwd) {
		ModelAndView model = new ModelAndView();
		//회원 검증하기
		boolean checkUser = membership.isCheckPass(id, pwd);
		System.out.println(id);
		System.out.println(pwd);
		if(checkUser) {
			//회원정보 가져오기
			model.addObject("userInfo",membership.memberInfo(id));
//			model.setViewName("/component/top");
			model.setViewName("/login/myPage");  
		}else {
			model.addObject("userInfo","false");
			model.setViewName("/login/myPageCertification");
		}
		return model;
	}
	//작업리스트
	@GetMapping("/click_show_myList")
	public @ResponseBody Map<String, Object> showList(@RequestParam("username")String id ) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AISM_User_Work_List_DTO> list = new Vector<AISM_User_Work_List_DTO>();
		list = membership.myWorkList(id);
		map.put("list",list);
	return map;
	}
	
	//아이디 찾기
	@PostMapping("findId.go")
	public @ResponseBody Map<String, String> findMemberId(@RequestParam("birthyear") String birthyear,
			@RequestParam("email") String email ) {
		Map<String, String> map = new HashMap<String, String>();
		String userId = membership.findMemberId(birthyear, email);
		map.put("userId", userId);
		map.put("success", "success");
		return map;
	}
	//비밀번호 찾기
	@PostMapping("findPwd.go")
	public @ResponseBody Map<String, Integer> findMemberPwd(@RequestParam("userId") String id,
			@RequestParam("email") String email ) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int userPwd = membership.findMemberPwd(id, email);
		map.put("userPwd", userPwd );
		System.out.println(userPwd);
		return map;
	}
	//비밀번호 분실후 재설정
	@PostMapping("updatePwd.go")
	public @ResponseBody Map<String, String> findMemberUpdatePwd(
			@RequestParam("userId") String id,
			@RequestParam("email") String email,
			@RequestParam("updatePwd") String updatePwd ) {
		Map<String, String> map = new HashMap<String, String>();
		membership.findMemberUpdatePwd(id, email, updatePwd);
		map.put("success","success");
		return map;
	}
	//회원정보 수정
	@GetMapping("updateUserInfo")
	public @ResponseBody int updateUserInfo(@RequestParam Map<String, String> map,HttpSession session) {
		String updatepwd = map.get("updatepwd");
		String id = map.get("id");
		String pwd = map.get("pwd");
		String job = map.get("job");
		String profile = map.get("profile");
		String email = map.get("email");
		String phone = map.get("phone");
		String addr = map.get("addr");
		String nick = map.get("nick");
		String username = map.get("username");
		System.out.println( "닉네임"+nick);
		System.out.println( "이름"+username);
		System.out.println( "주소"+addr);
		System.out.println("업데이트 비밀번호"+updatepwd);
		System.out.println("비밀번호"+pwd);
		int result = 0;
		
		boolean checkUser = membership.isCheckPass(id, pwd);
		if(checkUser) {
			if(updatepwd == null) {
				membership.updateUserInfo(id, email, job, addr, phone, profile, username, nick);
				session.setAttribute("profileImg", profile);
			}else {
				//비밀번호를제외한 모든 정보 변경
				membership.updateUserInfo(id, email, job, addr, phone, profile, username, nick);
				session.setAttribute("profileImg", profile);
				//비밀번호 변경
				membership.findMemberUpdatePwd(id, email, updatepwd);
			}
			
			System.out.println("업데이트 성공");
			//정상적으로 완료
			result = 1;
		}else {
			//비밀번호 틀렸을시
			System.out.println("업데이트 실패");
			result = 0;			 
		}
	return result;	
	}
	//마이 페이지 이동
		@PostMapping("show_detail_album")
		public @ResponseBody ModelAndView show_detail_album(@RequestParam("userName") String user ,@RequestParam("albumName") String albumName) {
			ModelAndView model = new ModelAndView();
			System.out.println(user);
			System.out.println(albumName);
			//회원정보 가져오기
			model.addObject("userInfo",membership.showDetailAlbum(user, albumName));
			model.setViewName("/login/workList/albumDetail");
			return model;
		}
	//내 곡관리
		@GetMapping("myAlbumList")
		public String  myAlbumList () {
			
			return "/component/myAlbum/myAlbum";
		}
		
		
}
