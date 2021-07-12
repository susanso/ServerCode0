package data.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView  extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File)model.get("downloadFile");
		String finalfileName =(String)model.get("finalfileName");
		System.out.println(finalfileName);
		String finaldownType =(String)model.get("finaldownType");
		System.out.println("test01");
		//개선사항 있음
        if(file != null) {
//            String fileName = null;
//            String userAgent = request.getHeader("User-Agent");
//            if(userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1){
//                fileName = URLEncoder.encode(file.getName(), "utf-8").replaceAll("\\+", "%20");
//            }else if(userAgent.indexOf("Chrome") > -1) {
//            	StringBuffer sb = new StringBuffer();
//            	for(int i=0; i<file.getName().length(); i++) {
//            		char c = file.getName().charAt(i);
//            		if(c > '~') {
//            			sb.append(URLEncoder.encode(""+c, "UTF-8"));
//            		}else {
//            			sb.append(c);
//            		}
//            	}
//            	StringBuffer mm = new StringBuffer();
//            	//여기서 문자열을 가져와 자른다
//            	
//            	System.out.println("mm입니다"+mm);
//            	System.out.println("finaldownType : "+finaldownType);
//            	
//            }
            String name = "파일이름";
            
            String header = request.getHeader("User-Agent");
            if (header.contains("Edge")){
                name = URLEncoder.encode(finalfileName, "UTF-8").replaceAll("\\+", "%20");
                response.setHeader("Content-Disposition", "attachment;filename=\"" + name +"."+finaldownType);
            } else if (header.contains("MSIE") || header.contains("Trident")) { // IE 11버전부터 Trident로 변경되었기때문에 추가해준다.
                name = URLEncoder.encode(finalfileName, "UTF-8").replaceAll("\\+", "%20");
                response.setHeader("Content-Disposition", "attachment;filename=" + name +"."+finaldownType);
            } else if (header.contains("Chrome")) {
                name = new String(finalfileName.getBytes("UTF-8"), "ISO-8859-1");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + name +"."+finaldownType);
            } else if (header.contains("Opera")) {
                name = new String(finalfileName.getBytes("UTF-8"), "ISO-8859-1");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + name +"."+finaldownType);
            } else if (header.contains("Firefox")) {
                name = new String(finalfileName.getBytes("UTF-8"), "ISO-8859-1");
                response.setHeader("Content-Disposition", "attachment; filename=" + name +"."+finaldownType );
            } else if (header.contains("Safari")) {
                name = new String(finalfileName.getBytes("UTF-8"), "ISO-8859-1");
                response.setHeader("Content-Disposition", "attachment; filename=" + name +"."+finaldownType );
            }
            
            response.setContentType(getContentType());
            response.setContentLength((int)file.length());
//          response.setHeader("Content-Disposition", "attachment; filename=" + finalfileName+"."+finaldownType+ ";");
//        	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(finalfileName, "utf-8")+"."+finaldownType+ ";");
            	
            	
            
            
//          response.setHeader("Content-Transfer-Encoding", "binary");
        	response.setHeader("Content-type", "application/pdf");
        	response.setHeader("Content-type", "application/mp3");
        	response.setHeader("Content-type", "application/midi");
            OutputStream out = response.getOutputStream();
            FileInputStream fis = null;
            try {
                fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, out);
            } catch(Exception e){
                e.printStackTrace();
            }finally{
                if(fis != null){
                    try{
                        fis.close();
                    }catch(Exception e){
                    	e.printStackTrace();
                    }
                }
                if(out != null) {
                	out.flush();
                }
            }
        }
	}
}
