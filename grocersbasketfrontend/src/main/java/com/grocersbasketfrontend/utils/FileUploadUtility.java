package com.grocersbasketfrontend.utils;



import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {
private static final String ABS_PATH="C:\\Users\\D\\grocersbasketecom\\grocersbasketfrontend\\src\\main\\webapp\\img\\";
private static String REAL_PATH="";
public static void uploadFile(HttpServletRequest request, MultipartFile image) {
	String imageName=request.getParameter("productName");
	REAL_PATH=request.getSession().getServletContext().getRealPath("/img/");

if(!new File(ABS_PATH).exists()) {
	
	new File(ABS_PATH).mkdirs();
}

if(!new File(REAL_PATH).exists()) {
	
	new File(REAL_PATH).mkdirs();
}

try {
	//server upload
	image.transferTo(new File(REAL_PATH + imageName + ".png"));
	//project directory upload
	image.transferTo(new File(ABS_PATH + imageName + ".png"));
}
catch(IOException ex) {
	
}

}
}
