<%
	String data="[[11,\"adfa\"],[12,\"aaadfa\"]]";
    String callback = request.getParameter("callback");
    
    out.print(callback+"("+data+")");
   // out.print(data);
%>