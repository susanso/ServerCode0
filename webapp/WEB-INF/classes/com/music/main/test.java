package com.music.main;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//@RestController
public class test {
	//가장 먼저 출력 되는 페이지
	public String home() {
		
		return "home";
	}
	
//	음악 상세설정 csv 가져오는 메소드
	@GetMapping("jsonGood.do")
    public @ResponseBody Map<String, Object> run() {
    	//List<String[]> listrow = new Vector<String[]>(); 
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		String path = "C:\\csvsample\\ex01.csv";
		String encoding = "utf-8";
        BufferedReader br = null;
        String line;
        String[] field1 = null;
        int i =0;
        int cnt = 0;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(path), encoding));
            
            while ((line = br.readLine()) != null) {
                field1 = line.split("\n");
                System.out.println(Arrays.toString(field1));
                map.put("instrument"+i, field1);
                System.out.println(i+"번째 배열 저장 성공");
                i++;
                cnt++;
            }
            int rowcnt = cnt-1;
            map.put("cnt", rowcnt);
            map.remove("instrument"+0);
            
            System.out.println(map);
            //System.out.println(listrow);
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
		return map;
    }
	
  //파이썬01
    @GetMapping("heightenMidi")
    public @ResponseBody Map<String,String> heightenMidi() {
    	Map<String, String> map = new HashMap<String, String>();
            Process proc;
            try {
                proc = Runtime.getRuntime().exec("python  C:\\csvsample\\testpython.py");
                BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
                String line = null;
                while ((line = in.readLine()) != null) {
                    System.out.println(line);
                }
                in.close();
                proc.waitFor();
                map.put("success", "success");
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
//            map.put("success", "success");
            return map;
        }
  //파이썬02    
    @GetMapping("softMidi")
    public @ResponseBody Map<String,String> softMidi() {
    	Map<String, String> map = new HashMap<String, String>();
            Process proc;
            try {
                proc = Runtime.getRuntime().exec("sudo python3  /usr/local/lib/apache-tomcat-8.5.24/webapps/AISM/POP_bright_web/Main_Generate_Song.py");
                BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
                String line = null;
                while ((line = in.readLine()) != null) {
                    System.out.println(line);
                }
                in.close();
                proc.waitFor();
                map.put("success", "success");
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
//            map.put("success", "success");
            return map;
        }
    //파이썬03
    @GetMapping("dreamyMidi")
    public static void dreamyMidi() {

            Process proc;
            try {
                proc = Runtime.getRuntime().exec("sudo python3 /usr/local/lib/apache-tomcat-8.5.24/webapps/AISM/testmidi.py");
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
        }
    @GetMapping("POPGenerate")
    public static void POPGenerate() {

            Process proc;
            try {
                proc = Runtime.getRuntime().exec("sudo python3 /usr/local/lib/apache-tomcat-8.5.24/webapps/AISM/testmidi.py");
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
        }
    //작곡페이지 step01~05로 이동
	@GetMapping("/composeStep")
	public String compose() {
		String a = "component/compose/composeStep";
	return a;
	}
	//작곡소개 페이지로 이동
	@GetMapping("/composePage")
	public String startCompose() {
		String a = "component/compose/composePage";
	return a;
	}
	@GetMapping("/test.do")
	public void test01() {
			
//		String directory = "python C:\\csvsample\\test.py";
//		
//		 Runtime rt = Runtime.getRuntime();
//         System.out.println("directory1: " + directory);
////         Process p;
//          
//         try {
//        	 System.out.println("directory2: " + directory);
////             p = rt.exec(directory);
//             System.out.println(rt.exec(directory));
////             p.waitFor();
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//		String path = System.getProperty("C:\\csvsample.dir");
//		System.out.println("Working Directory = " + path);
		
		String s = null;

        try {
            // print a message
            System.out.println("Executing python code");
            Process process = Runtime.getRuntime().exec("sudo python3 /home/kkb08190819/test.py");
            
            BufferedReader stdInput = new BufferedReader(new 
                 InputStreamReader(process.getInputStream()));

            BufferedReader stdError = new BufferedReader(new 
                 InputStreamReader(process.getErrorStream()));

            // read the output from the command
            System.out.println("python should be run.");
            while ((s = stdInput.readLine()) != null) {
                System.out.println(s);
            }
            
            System.out.println("Here is the standard error of the command (if any):\n");
            while ((s = stdError.readLine()) != null) {
                System.out.println(s);
            }
//            System.exit(0);
        }
        catch (IOException e) {
            e.printStackTrace();
//            System.exit(-1);
        }
    }
}



