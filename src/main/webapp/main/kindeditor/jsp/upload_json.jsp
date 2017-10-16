<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.json.JSONObject" %>
<%--<script language="javascript"  src="json2.js"></script>--%>
<%

/**
 * KindEditor JSP
 * 
 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */

//文件保存目录路径
String savePath1 = pageContext.getServletContext().getRealPath("") + "main/kindeditor/attached/";
String savePath = savePath1.substring(0,savePath1.lastIndexOf("\\"))+"/upload/";
System.out.println("savePath"+savePath);
//文件保存目录URL
//String saveUrl1  = request.getContextPath() + "/main/kindeditor/attached/";
//StringBuffer url = request.getRequestURL();
//String saveUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").append("upload/").toString();
String saveUrl = request.getContextPath()+"/upload/";
System.out.println("saveUrl="+saveUrl);
//定义允许上传的文件扩展名
HashMap<String, String> extMap = new HashMap<String, String>();
extMap.put("image", "gif,jpg,jpeg,png,bmp");
extMap.put("flash", "swf,flv");
extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

//最大文件大小
long maxSize = 1000000;
response.setContentType("text/html; charset=UTF-8");
if(!ServletFileUpload.isMultipartContent(request)){
	return;
}

String dirName = request.getParameter("dir");
if (dirName == null) {
	dirName = "image";
}
if(!extMap.containsKey(dirName)){

	return;
}
//创建文件夹
savePath += dirName + "/";
saveUrl += dirName + "/";
File saveDirFile = new File(savePath);
if (!saveDirFile.exists()) {
	saveDirFile.mkdirs();
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
String ymd = sdf.format(new Date());
savePath += ymd + "/";
saveUrl += ymd + "/";
File dirFile = new File(savePath);
if (!dirFile.exists()) {
	dirFile.mkdirs();
}

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8");
List items = upload.parseRequest(request);
Iterator itr = items.iterator();
while (itr.hasNext()) {
	FileItem item = (FileItem) itr.next();
	String fileName = item.getName();
	long fileSize = item.getSize();
	if (!item.isFormField()) {
		//检查文件大小
		if(item.getSize() > maxSize){

			return;
		}
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
			return;
		}

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		try{
			File uploadedFile = new File(savePath, newFileName);
			item.write(uploadedFile);
		}catch(Exception e){
			return;
		}

		JSONObject obj = new JSONObject();
		System.out.println(saveUrl + newFileName);
		obj.put("error", 0);
		obj.put("url", saveUrl + newFileName);
		out.println(obj.toString());
	}
}
%>
