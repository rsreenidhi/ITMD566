<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

	
  <%
	if(request.getparameter("email")){
		request.setAttribute("nameError", "DAMAR NAME");
	}  

  %>
  <jsp:useBean id="formHandler" class="webapp.FormBean" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 
  formHandler.validate();
%>
   	<jsp:forward page = "error.jsp" />
   
