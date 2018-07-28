<%@ page contentType="text/html;charset=UTF-8"%>
<%
	out.print("用户名：" + session.getAttribute("userid") + "<br>");
	String userrole = "";
	if (session.getAttribute("userrole").equals("0"))
		userrole = "管理员";
	if (session.getAttribute("userrole").equals("1"))
		userrole = "普通用户";
	out.print(userrole + "<br>");
	out.print("发帖数：" + session.getAttribute("usergrade") + "<br>");
%>