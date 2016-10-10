<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	
	/*
	http://ws.niems.go.th/EMS_MAP_API/EMSInfo.svc/reqLogin?inUSERNAME={inUSERNAME}&inPASSWORD={inPASSWORD}&appid={appid}&key={key}
	appid = dwh key = dwh12345
	inUSERNAME=3490500145408
	inPASSWORD= anurut
	
	
	
	*/
	String dataJson="";
	String user_name = request.getParameter("user_name");
	String password = request.getParameter("password");
	String appid = request.getParameter("appid");
	String key = request.getParameter("key");
	String role = String.valueOf(session.getAttribute("role"));
	
	String callback = request.getParameter("callback");
	
	
	//if(role.equals("Admin")){
	
		if((user_name.equals("3490500145408")) && (password.equals("anurut"))){
			
			dataJson+="{";
				dataJson+="\"LOG_INResult\": [{\"FILEPATH\":null,\"TITLE_NAME\":\"นาย\",\"FIRST_NAME\":\"อนุรัตน์\",\"LAST_NAME\":\"สมตน\",\"ID_CARD\":null,\"POSITIONS\":\"2\",\"DEP_NAME\":\"สถาบันการแพทย์ฉุกเฉินแห่งชาติ\",\"BIRTHDATE\":\"25-05-2011\",\"ADDRESS\":\"   \",\"SOI\":null,\"ROAD\":null,\"POSTCODE\":null,\"MOO_CODE\":\"00\",\"TAMBOL_CODE\":\"00\",\"AMPHUR_CODE\":\"00\",\"CHANGWAT_CODE\":\"02\",\"CHANGWAT_NAME\":null,\"AMPHUR_NAME\":null,\"TUMBON_NAME\":null,\"PHONE\":null}]";
			dataJson+="}";
			
			
			
			//dataJson+="[{\"FILEPATH\":null,\"TITLE_NAME\":\"นาย\",\"FIRST_NAME\":\"อนุรัตน์\",\"LAST_NAME\":\"สมตน\",\"ID_CARD\":null,\"POSITIONS\":\"2\",\"DEP_NAME\":\"สถาบันการแพทย์ฉุกเฉินแห่งชาติ\",\"BIRTHDATE\":\"25-05-2011\",\"ADDRESS\":\"   \",\"SOI\":null,\"ROAD\":null,\"POSTCODE\":null,\"MOO_CODE\":\"00\",\"TAMBOL_CODE\":\"00\",\"AMPHUR_CODE\":\"00\",\"CHANGWAT_CODE\":\"02\",\"CHANGWAT_NAME\":null,\"AMPHUR_NAME\":null,\"TUMBON_NAME\":null,\"PHONE\":null}]";
			// out.println(callback+"("+dataJson+")");
			 out.println(dataJson);
			 session.setAttribute("authen","success"); 
			 session.setAttribute("authorize","supper_user"); 
			
		}else{
			out.println("[\"empty\"]");
			//out.println(callback+"([\"empty\"])");
		}
		
	 //}else{
		  	//out.println("[\"Access denied Press contact to administor.\"]");
		  	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
	 // }
	
	
	
	//http://192.168.1.49:8082/niems/Model/login/authen_items.jsp?callback=?&user_name=3490500145408&password=anurut&appid=dwh&key=dwh12345
	%>
	
	
