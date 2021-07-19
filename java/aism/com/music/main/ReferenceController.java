package aism.com.music.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aism.data.dto.AISM_ComposeDTO;
import aism.data.dto.AISM_User_Work_List_DTO;
import aism.data.service.AISM_Compose_ServiceInter;
import aism.data.service.AISM_User_Membership_Info_ServiceInter;

@Controller
public class ReferenceController {

	@Autowired
	private AISM_Compose_ServiceInter compose;
	@Autowired
	private AISM_User_Membership_Info_ServiceInter member;
	
	@GetMapping("getReferenceKey")
	public @ResponseBody Map<String, Object> getReferenceInfo(
			@RequestParam("songName") String title,
			@RequestParam("artist") String artist
			){
		Map<String, Object> map = new HashMap<String, Object>();
		String Key = compose.getReferenceKey(artist, title);
		map.put("result",Key);
		return map;
	}
	
//	@PostMapping("startReference")
	@GetMapping("startReference")
	public @ResponseBody Map<String,Object> startReference(
			@RequestParam("userId")String userId,
			@RequestParam("songName")String songName,
			@RequestParam("artist")String artist,
			@RequestParam("referencePercent")String referencePercent,
			@RequestParam("GS") String GS
			){
		//21-01-08[AISM-1]윤종신-팥빙수
		String song = artist+"-"+songName;
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(userId);
		System.out.println(songName);
		System.out.println(artist);
		System.out.println(referencePercent);
		System.out.println(GS);
		Process proc;
		try {
			
//	       	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
			if(GS.equals("GS")) {
				proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Reference_Make_ver_1.7/Main_ReadDB.py "+userId+" "+songName+" "+artist+" "+referencePercent+" "+GS);
			}else if(GS.equals("GS2")) {
				proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Make_NewCluster/Main_MakeSong.py "+userId+" "+songName+" "+artist);
			}else {
				proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Reference_Make_ver_1.7/Main_ReadDB.py "+userId+" "+songName+" "+artist+" "+referencePercent+" "+GS);
			}
	        
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	        
	        String line = null;
	        List<String> values = new ArrayList<String>();
	        while ((line = in.readLine()) != null) {
	        	System.out.println(line);
	        	values.add(line);
            }
            in.close();
            proc.waitFor();
            map.put("values", values);
            map.put("song", song);
            map.put("GS_type", GS);
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		//권한 주기
		Process proc1;
		try {
//	       	proc1 = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
	        proc1 = Runtime.getRuntime().exec("sudo chmod -R 777 /home/ubuntu/tomcat/webapps/AISM/usr/"+userId+"/");
	            
            proc1.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    	return map;
	}
	//저장하기 클릭시 정보를 가지고 와서 나의 리스트에 뿌리기
	@PostMapping("/show_myList")
	public ModelAndView showList(@RequestParam("username")String id ) {
		ModelAndView model = new ModelAndView();
		List<AISM_User_Work_List_DTO> list = new Vector<AISM_User_Work_List_DTO>();
		list = member.myWorkList(id);
		model.addObject("list",list);
		model.addObject("worklist","good");
		model.setViewName("component/myAlbum/myAlbum");
	return model;
	}
	//저장하기 클릭시 정보 저장
	@GetMapping("/insert_myList")
	public  @ResponseBody Map<String,Object> insert_myList(
			@ModelAttribute AISM_User_Work_List_DTO dto ,
			@RequestParam("user")String user,
			@RequestParam("subject")String subject
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		//중복된 값이 있을경우
		if(member.hasmyWorkList(user, subject)) { 
			member.insertmyWorkList(dto);
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
		
	@PostMapping("/getsongInfo")
	public @ResponseBody Map<String,Object> songInfo(
			@RequestParam("user") String user,
			@RequestParam("jsonName") String jsonName
			){
		Map<String, Object> map = new HashMap<String, Object>();
		String runtimePath = "/home/ubuntu/tomcat/webapps/AISM/usr/"+user+"/"+jsonName+".json";
//		String runtimePath = "C:/json/"+jsonName+".json";
		BufferedReader runtimebr = null;
        String runtimeline;
        String runtimefield = null;
        
        try {
        	runtimebr = new BufferedReader(new InputStreamReader(new FileInputStream(runtimePath), "utf-8"));
        	
            while ((runtimeline = runtimebr.readLine()) != null) {
            	runtimefield = runtimeline;
            	System.out.println(runtimefield);
                map.put("jsonInfo", runtimefield);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (runtimebr != null) {
                try {
                	runtimebr.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    	return map;
	}
	@GetMapping("change_reference")
	public @ResponseBody Map<String,Object> changeReference(
			@RequestParam("user")String userId,
			@RequestParam("songName")String songName,
			@RequestParam("OX")String OXList
			){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(userId);
		System.out.println(songName);
		System.out.println(OXList);
		Process proc;
		try {
			//proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
	        proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Reference_Make_ver_1.7/Main_ChangeSong.py "+userId+" "+songName+".mid "+OXList);
	        BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	            
	        String line = null;
	        List<String> values = new ArrayList<String>();
	        while ((line = in.readLine()) != null) {
	        	System.out.println(line);
	        	values.add(line);
            }
	        
            in.close();
            proc.waitFor();
            map.put("success", "success");
            map.put("values", values);
        	map.put("songName", songName+"_Re");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        	return map;
	}
	//내리스트 삭제		
	@GetMapping("delete_myList")
		public  @ResponseBody Map<String,Object> delete_myList(
				@RequestParam("userId") String userId,
				@RequestParam("project") String project
				) {
		//파일 삭제
		 String[] type = new String[]{".pdf",".mid",".mp3",".json"};
		 String errorMsg = "";
		 
		 for(int i =0 ;i < 4; i++) {
			File file = new File("/home/ubuntu/tomcat/webapps/AISM/usr/"+userId+"/Save/"+project+type[i]);
			if( file.exists() ){
				if(file.delete()){
					member.deletemyWorkList(userId, project);
					System.out.println("파일삭제 성공");
					errorMsg = "파일삭제 성공";
					member.deletemyWorkList(userId, project);
				}else{
					System.out.println("파일삭제 실패"); 
					errorMsg = "파일삭제 실패";
					break;
				}
			}else{
				System.out.println("파일이 존재하지 않습니다");
				errorMsg = "파일이 존재하지 않습니다";
			}
		 }

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileResult", errorMsg);
		map.put("result", "success");
		return map;
		}
}





