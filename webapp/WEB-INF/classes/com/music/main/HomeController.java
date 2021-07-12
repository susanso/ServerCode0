package com.music.main;

import java.io.BufferedReader;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.AISM_ComposeDTO;
import data.service.AISM_Compose_ServiceInter;

@Controller
public class HomeController {
	
	@Autowired
	private AISM_Compose_ServiceInter compose;
	
	//가장 먼저 출력 되는 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
			System.out.println("home");
		return "home";
	}
	//favicon
	@RequestMapping("/favicon.ico") public String favIconForward(){
		return "forward:/image/favicon/favicon_pc.png"; 
	}

	//로그인 페이지 이동
	@GetMapping(value = "login.do")
	public String loginPage() {
		return "login/login";
	}
	
    @GetMapping("/makeSong")
    public @ResponseBody Map<String,Object> makeSong(
    		@RequestParam("generateCount") String generateCount,
    		@RequestParam("createCount") String createCount,
    		@RequestParam("genre") String genre,
    		@RequestParam("keyword") String keyword,
    		@RequestParam("playtime") String playtime,
    		@RequestParam("bpm") String bpm,
    		@RequestParam("musickey") String musickey,
    		@RequestParam("melody") String melody,
    		@RequestParam("mainInst") String mainInst,
    		@RequestParam("mainInstnum") String mainInstnum,
    		@RequestParam("subInst0") String subInst0,
    		@RequestParam("subInst0num") String subInst0num,
    		@RequestParam("subInst1") String subInst1,
    		@RequestParam("subInst1num") String subInst1num,
    		@RequestParam("subInst2") String subInst2,
    		@RequestParam("subInst2num") String subInst2num,
    		@RequestParam("subInst3") String subInst3,
    		@RequestParam("subInst3num") String subInst3num,
    		@RequestParam("subInst4") String subInst4,
    		@RequestParam("subInst4num") String subInst4num,
    		@RequestParam("subInst5") String subInst5,
    		@RequestParam("subInst5num") String subInst5num,
    		@RequestParam("subInst6") String subInst6,
    		@RequestParam("subInst6num") String subInst6num,
    		@RequestParam("subInst7") String subInst7,
    		@RequestParam("subInst7num") String subInst7num,
    		@RequestParam("subInst8") String subInst8,
    		@RequestParam("subInst8num") String subInst8num,
    		@RequestParam("subInst9") String subInst9,
    		@RequestParam("subInst9num") String subInst9num,
    		@RequestParam("subInst10") String subInst10,
    		@RequestParam("subInst10num") String subInst10num,
    		@RequestParam("subInst11") String subInst11,
    		@RequestParam("subInst11num") String subInst11num,
    		@RequestParam("subInst12") String subInst12,
    		@RequestParam("subInst12num") String subInst12num,
    		@RequestParam("subInst13") String subInst13,
    		@RequestParam("subInst13num") String subInst13num,
    		@RequestParam("subInst14") String subInst14,
    		@RequestParam("subInst14num") String subInst14num,
    		@RequestParam("subInst15") String subInst15,
    		@RequestParam("subInst15num") String subInst15num,
    		@RequestParam("subInst16") String subInst16,
    		@RequestParam("subInst16num") String subInst16num,
    		@RequestParam("subInst17") String subInst17,
    		@RequestParam("subInst17num") String subInst17num,
    		@RequestParam("subInst18") String subInst18,
    		@RequestParam("subInst18num") String subInst18num,
    		@RequestParam("subInst19") String subInst19,
    		@RequestParam("subInst19num") String subInst19num,
    		@RequestParam("subInst20") String subInst20,
    		@RequestParam("subInst20num") String subInst20num,
    		@RequestParam("sessionBoolean") String sessionBoolean
    		){
		    	Map<String, Object> map = new HashMap<String, Object>();
		        Process proc;
		        try {
//		        	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
		            proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Main_Generate_Song.py"
		            			+" "+sessionBoolean+" "+generateCount+" "+createCount+" "+bpm+" "+musickey+" "+playtime+" "+melody+" "+mainInst+" "+mainInstnum+" "+subInst0+" "+subInst0num+" "+subInst1+" "+subInst1num+" "+subInst2+" "+subInst2num+" "
		            			+subInst3+" "+subInst3num+" "+subInst4+" "+subInst4num+" "+subInst5+" "+subInst5num+" "+subInst6+" "+subInst6num+" "+subInst7+" "+subInst7num+" "
		            			+subInst8+" "+subInst8num+" "+subInst9+" "+subInst9num+" "+subInst10+" "+subInst10num+" "+subInst11+" "+subInst11num+" "+subInst12+" "+subInst12num+" "
		            			+subInst13+" "+subInst13num+" "+subInst14+" "+subInst14num+" "+subInst15+" "+subInst15num+" "+subInst16+" "+subInst16num+" "+subInst17+" "+subInst17num+" "
		            			+subInst18+" "+subInst18num+" "+subInst19+" "+subInst19num+" "+subInst20+" "+subInst20num);
		            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
		            List<String> values = new ArrayList<String>();
		            String line = null;
		            while ((line = in.readLine()) != null) {
//		                System.out.println(line);
		            	values.add(line);
		            }
		            in.close();
		            proc.waitFor();
		            map.put("success", "success");
		            map.put("values", values);
//		            map.put("generateCount", generateCount);
		        } catch (IOException e) {
		            e.printStackTrace();
		        } catch (InterruptedException e) {
		            e.printStackTrace();
		        }
        return map;
    }
    //작곡페이지 step01~05로 이동
	@GetMapping("/composeStep")
	public  @ResponseBody ModelAndView compose() {
		ModelAndView model = new ModelAndView();
		List<AISM_ComposeDTO> grnreList = new Vector<AISM_ComposeDTO>();
		List<AISM_ComposeDTO> keyWordList = new Vector<AISM_ComposeDTO>();
		grnreList = compose.selectGenre();
		keyWordList = compose.selectKeyword();
		model.addObject("grnreList",grnreList);
		model.addObject("keyWordList",keyWordList);
		model.setViewName("component/compose/composeMood");
	return model;
	}
	//레퍼런스기반 작곡 페이지로 이동
	@GetMapping("composeReference")
	public String composeReference() {
		return "component/compose/composeReference";
	}
	//작곡소개 페이지로 이동
	@GetMapping("composePage")
	public String startCompose() {
		String a = "component/compose/composeSelectPage";
	return a;
	}
	//openMarket 로 이동
	@GetMapping("openMarket")
	public String openMarket() {
		String a = "component/market/market";
	return a;
	}
	//billing 으로 이동
	@GetMapping("bill")
	public String bill() {
		return "component/billing/billing";
	}
	//notice 으로 이동
		@GetMapping("notice")
		public String notice() {
			return "component/notice/notice";
		}
	//company 페이지로 이동
	@GetMapping("company")
	public String company(){
		return "component/company/company";
	}
	
	//처음 장르 클릭시  키워드보이기
	@GetMapping("genreClickKeyword")
	public @ResponseBody List<AISM_ComposeDTO> genreClickKeyword (String genre){
		List<AISM_ComposeDTO> list = new Vector<AISM_ComposeDTO>();
		list = compose.genreClickKeyword(genre);
	return list;
	}
	//키워드 클릭시 분위기랑 빠르기 자동 active
	@GetMapping("KeywordClickMoodTempo")
	public @ResponseBody List<AISM_ComposeDTO> KeywordClickMoodTempo(String keyword){
		List<AISM_ComposeDTO> list = new Vector<AISM_ComposeDTO>();
		list = compose.KeywordClickMoodTempo(keyword);
	return list;
	}
	//분위기 클릭시
	@GetMapping("moodClickKeyword")
	public @ResponseBody List<AISM_ComposeDTO> moodClickKeyword (
			@RequestParam("genre")String genre,
			@RequestParam("mood")String mood){
		List<AISM_ComposeDTO> list = new Vector<AISM_ComposeDTO>();
		list = compose.moodClickKeyword(genre, mood);
	return list;
	}
	//빠르기 클릭시
	@GetMapping("tempoClickKeyword")
	public @ResponseBody List<AISM_ComposeDTO> tempoClickKeyword (
			@RequestParam("genre")String genre,
			@RequestParam("mood")String mood,
			@RequestParam("tempo")String tempo){
		List<AISM_ComposeDTO> list = new Vector<AISM_ComposeDTO>();
		list = compose.tempoClickKeyword(genre, mood, tempo);
	return list;
	}
	//악기만 재생
	@PostMapping("instPlay.do")
	public @ResponseBody Map<String,Object>  instPlay(
			@RequestParam("keyword") String keyword,
			//송폼 이름
			@RequestParam("songForm") String songForm,
			//음악 타입
			@RequestParam("instType") String instType,
			//악기 번호
			@RequestParam("instValue") String instValue,
			@RequestParam("sessionBoolean") String sessionBoolean)
			{
		Map<String, Object> map = new HashMap<String, Object>();
	    Process proc;
	    String realPath =  "/home/ubuntu/tomcat/webapps/AISM/usr/"+sessionBoolean+"/"+songForm+"_"+instType+".mid";
	    String playPath =  "sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Play_Sample_Sound.py "+sessionBoolean+" "+realPath+" "+instValue;
	    try {
	        proc = Runtime.getRuntime().exec(playPath);
	        BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	        
	        String line = null;
	        while ((line = in.readLine()) != null) {
	            System.out.println(line);
	        }
	        in.close();
	        proc.waitFor();
	        map.put("instPlaySuccess", "success");
	        map.put("songForm",songForm);
	        map.put("instType", instType);
	        map.put("instValue", instValue);
	        map.put("keyword", keyword);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (InterruptedException e) {
	        e.printStackTrace();
	    }
	    return map;
    }
		
	//곡 기본 설정
	@GetMapping("/basicSetting")
	public @ResponseBody Map<String,Object> basicSetting(
			@RequestParam("sessionBoolean") String sessionBoolean
			){
		Map<String, Object> map = new HashMap<String, Object>();
		String runtimePath = "/home/ubuntu/tomcat/webapps/AISM/usr/"+sessionBoolean+"/Basic_Setting.json";
//		String runtimePath = "C:\\json\\Basic_Setting.json";
		BufferedReader runtimebr = null;
        String runtimeline;
        String runtimefield = null;
        try {
        	runtimebr = new BufferedReader(new InputStreamReader(new FileInputStream(runtimePath), "utf-8"));
        	
            while ((runtimeline = runtimebr.readLine()) != null) {
            	runtimefield = runtimeline;
            	System.out.println(runtimefield);
                map.put("runtime", runtimefield);
                
                System.out.println("기본 설정 완료");
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
        // 송폼 정보
        String songFormPath = "/home/ubuntu/tomcat/webapps/AISM/usr/"+sessionBoolean+"/SongForm_RunTime.json";
//        String songFormPath = "C:\\json\\SongForm_RunTime.json";
		BufferedReader songFormbr = null;
        String songFormLine;
        String songFormField = null;
        try {
        	songFormbr = new BufferedReader(new InputStreamReader(new FileInputStream(songFormPath), "utf-8"));
        	
            while ((songFormLine = songFormbr.readLine()) != null) {
            	songFormField = songFormLine;
            	System.out.println(songFormField);
                map.put("songForm", songFormField);
                
                System.out.println("송폼 저장 완료");
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (songFormbr != null) {
                try {
                	songFormbr.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
		return map;
	}
	//악기리스트,번호 가져오기
	@PostMapping("getDetailSetting")
	public @ResponseBody Map<String,Object> getDetailSetting(
			@RequestParam("sessionBoolean") String sessionBoolean,
			@RequestParam("melodyBoolean") boolean melodyBoolean
			){
		Map<String, Object> map = new HashMap<String, Object>();
		String runtimePath = "/home/ubuntu/tomcat/webapps/AISM/usr/"+sessionBoolean+"/SongForm_InstDetail.json";
//		String runtimePath ="C:\\json\\SongForm_InstDetail.json";
		BufferedReader runtimebr = null;
        String runtimeline;
        String runtimefield = null;
        try {
        	runtimebr = new BufferedReader(new InputStreamReader(new FileInputStream(runtimePath), "utf-8"));
        	
            while ((runtimeline = runtimebr.readLine()) != null) {
            	runtimefield = runtimeline;
            	System.out.println(runtimefield);
                map.put("settings", runtimefield);
                
                System.out.println("악기번호, 리스트  저장 완료");
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
        // 멜로디가 true면 멜로디를 정보가 담겨있는 json파일을 가져온다 
        if(melodyBoolean) {
        	System.out.println("melodyBoolean  상태");
        	System.out.println(melodyBoolean);
			String melodyPath = "/home/ubuntu/tomcat/webapps/AISM/usr/"+sessionBoolean+"/SongForm_Melody.json";
//			String melodyPath ="C:\\json\\SongForm_Melody.json";
			BufferedReader melodybr = null;
	        String melodyline;
	        String melodyfield = null;
	        try {
	        	melodybr = new BufferedReader(new InputStreamReader(new FileInputStream(melodyPath), "utf-8"));
	        	
	            while ((melodyline = melodybr.readLine()) != null) {
	            	melodyfield = melodyline;
	            	System.out.println(melodyfield);
	                map.put("melodyOption", melodyfield);
	                
	                System.out.println("멜로디 Boolean 저장 완료");
	            }
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (melodybr != null) {
	                try {
	                	melodybr.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
        }else {
        	  map.put("melodyOption", "none");
        }
		return map;
	}
	//연주법 변경
	@PostMapping("resetYeonZu")
	public @ResponseBody Map<String,Object> resetYeonZu(
			@RequestParam("keyword") String keyword,
			@RequestParam("bpm_num") String bpm_num,
			@RequestParam("key_value") String key_value,
			@RequestParam("sf") String sf,
			@RequestParam("ms_count") String ms_count,
			@RequestParam("ms_offset") String ms_offset,
			@RequestParam("sessionBoolean") String sessionBoolean,
			@RequestParam("instType") String instType,
			@RequestParam("instCase") String instCase,
			@RequestParam("instNum") String instNum
			){
		Map<String, Object> map = new HashMap<String, Object>();
        Process proc;
        try {
//        	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
            proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Change_YeonZu.py "+sessionBoolean+" "+bpm_num+" "+
            		key_value+" "+sf+" "+ms_count+" "+ms_offset+" "+instType+" "+instCase+" "+instNum);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            
//            String line = null;
//            while ((line = in.readLine()) != null) {
//            }
            in.close();
            proc.waitFor();
            map.put("success", "success");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        	return map;
	}
	//들어보기
	@PostMapping("changeSongForm")
	public @ResponseBody Map<String,Object> changeSongForm(
			@RequestParam("keyword") String keyword,
			@RequestParam("songFormName") String songFormName,
			@RequestParam("paramString") String paramString,
			@RequestParam("sessionBoolean") String sessionBoolean
			){
		Map<String, Object> map = new HashMap<String, Object>();
        Process proc;
        try {
//        	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
            proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Merge_OneSongForm.py "+songFormName+" "+sessionBoolean+" "+paramString);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            
            String line = null;
            while ((line = in.readLine()) != null) {
            }
            in.close();
            proc.waitFor();
            map.put("success", "success");
            map.put("songFormName", songFormName);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        	return map;
	}
	//적용하기
	@PostMapping("applySongForm")
	public @ResponseBody Map<String,Object> applySongForm(
			@RequestParam("keyword") String keyword,
			@RequestParam("songFormName") String songFormName,
			@RequestParam("paramString") String paramString,
			@RequestParam("sessionBoolean") String sessionBoolean
			){
		Map<String, Object> map = new HashMap<String, Object>();
        Process proc;
        try {
//        	proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
            proc = Runtime.getRuntime().exec("sudo python3 /home/ubuntu/tomcat/webapps/AISM/pop_KeyWord/Web_KeyWord_"+keyword+"/Apply_SongFormChange.py "+songFormName+" "+sessionBoolean+" "+paramString);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            
//            String line = null;
//            while ((line = in.readLine()) != null) {
//            }
            in.close();
            proc.waitFor();
            map.put("success", "success");
            map.put("songFormName", songFormName);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        	return map;
	}
}
