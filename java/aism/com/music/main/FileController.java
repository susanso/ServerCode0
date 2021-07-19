package aism.com.music.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {
	@RequestMapping("download.do")
	public ModelAndView download(ModelAndView mv, @RequestParam("downType") String downType,
			@RequestParam("sessionBoolean") String userId, @RequestParam("fileName") String fileName,
			@RequestParam("originFileName") String originFileName)
			 {
		String fullPath = "";
		if(downType.indexOf("mp3")> -1 || downType.indexOf("mid")> -1) {
			fullPath = "/home/ubuntu/tomcat/webapps/AISM/usr/" + userId +"/Save/"+originFileName+ "." + downType;
		}else{
			fullPath = "/home/ubuntu/tomcat/webapps/AISM/usr/" + userId +"/Save/" + fileName + "." + downType;
		}
		File file = new File(fullPath);
		mv.setViewName("downloadView");
		mv.addObject("downloadFile", file);
		mv.addObject("finalfileName", fileName);
		mv.addObject("finaldownType", downType);
		return mv;
	}
	
	@GetMapping("downloadFile")
	public @ResponseBody Map<String, String> downPDF(
				@RequestParam( "keyword") String keyword,
				@RequestParam( "fileName") String fileName,
				@RequestParam( "user") String userName
			){
		//작곡 모드 분류
		Process proc;
        try {
//        	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
        	
            proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Make_Melody_to_Image.py "+userName +" "+fileName);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
         
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
       
        
        Map<String, String> map = new HashMap<String, String>();
        map.put("fileName", fileName);
		map.put("result", "good");
		return map;
	}
	
	@GetMapping("referenceDownFile")
	public @ResponseBody Map<String, Object> referenceDownFile(
				@RequestParam( "sessionBoolean") String sessionBoolean,
				@RequestParam( "createSongName") String createSongName,
				@RequestParam( "originSongName") String originSongName,
				@RequestParam( "originComposer") String originComposer,
				@RequestParam( "MidiName") String MidiName,
				@RequestParam( "GS" ) String GS
			){
		Map<String, Object> map = new HashMap<String, Object>();
		Process proc;
        try {
        	//proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
        	if(GS.equals("GS2")) {
    			proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Make_NewCluster/Make_Melody_to_Image.py "+sessionBoolean+" "+createSongName+" "+originSongName+" "+originComposer+" "+MidiName+" "+GS);
        	}else {
        		proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/Reference_Make_ver_1.7/Make_Melody_to_Image.py "+sessionBoolean+" "+createSongName+" "+originSongName+" "+originComposer+" "+MidiName+" "+GS);	
        	}
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
           
            List<String> values = new ArrayList<String>();
            String line = null;
            while ((line = in.readLine()) != null) {
//                System.out.println(line);
        	values.add(line);
            }
            
            map.put("fileName", createSongName);
            map.put("values", values);
    		map.put("result", "good");
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		return map;
	}
	
	@PostMapping("/photo.do")
	public @ResponseBody Map<String, String> upload(@RequestParam("profileImg") MultipartFile upload,
			@RequestParam("id") String id, HttpServletRequest request) {
		// 이미지 저장 경로
//		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/tiles");
		String path = "/home/ubuntu/tomcat/webapps/AISM/usr/"+id+"/profile/";
		System.out.println("path=" + path);
		System.out.println("이미지명:" + upload.getOriginalFilename());
		// 저장할 파일명
		String fileName = upload.getOriginalFilename();
		String fullPath = path+""+fileName;
		// profile 폴더에 이미지 저장
		FileOutputStream fos = null;
		try {
			byte[] fileData = upload.getBytes();
			fos = new FileOutputStream(fullPath);
			// 이미지 저장
			fos.write(fileData);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//DB에 프로필 이름 저장
		
		// 호출하는 곳으로 보낼 이미지명
		Map<String, String> map = new HashMap<String, String>();
		map.put("profileImgName", fileName);
		map.put("fullPath", fullPath);
		return map;
	}
}
