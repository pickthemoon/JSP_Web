<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="gradeadd"%>
<style type="text/css">
p1 {
	font-size: 36px;
	font-weight: bold;
	font-style: italic;
	text-align: center;	
}
.a font {
	line-height: 0.5cm;
}
body {
	margin-top: 0.5cm;
	background-image: url(h.jpg);
}
</style>
<p1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;海角论坛</p1>
<p2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.jsp">主页</a>&nbsp;&nbsp;&nbsp;<a href="newPost.jsp">发帖</a>&nbsp;&nbsp;&nbsp;<a href="login.jsp">退出</a></p2>
<hr>
<%
	request.setCharacterEncoding("UTF-8");
	if (request.getParameter("Title") == "" || request.getParameter("Detail") == "") {
		out.print("请输入标题和内容！");
		return;
	}
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch(Exception e) {
		out.print("forName error: " + e);
	}
	try {
		Date postDate = new Date();
		java.sql.Timestamp sqlDate=new java.sql.Timestamp(postDate.getTime());
		String postWriter = session.getAttribute("userid").toString();
		Connection con;
		Statement sql;
		con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
		sql = con.createStatement();
		//out.print(session.getAttribute("userid").toString() + sqlDate + request.getParameter("Title") + request.getParameter("Detail"));
		if (!(sql.executeUpdate("INSERT INTO [jspforum].[dbo].[post] VALUES('" + session.getAttribute("userid").toString() + "', '" + sqlDate + 
			"', '" + request.getParameter("Title") + "', '" + request.getParameter("Detail") +"', '')") == 1)) {
			out.print("发帖失败！");
		}
		else {
			out.print("发帖成功！");
%>			<gradeadd:GradeAdd passid='<%=session.getAttribute("userid").toString()%>'></gradeadd:GradeAdd>
<%		}
	}
	catch (SQLException e) {
		out.print("SQL connection error: " + e);
	}
%>