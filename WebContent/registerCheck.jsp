<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
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
<p2>&nbsp;&nbsp;&nbsp;<a href="login.jsp">登录</a></p2>
<hr>
<%	
	request.setCharacterEncoding("UTF-8");
	if (request.getParameter("Uid") == "" || request.getParameter("Pw") == "" || request.getParameter("chkPw") == "") {
		out.print("请填写完整信息！");
		return;
	}
	if (!(request.getParameter("Pw").equals(request.getParameter("chkPw")))) {
		//boolean b = request.getParameter("Pw").equals(request.getParameter("chkPw"));
		//out.print(b + request.getParameter("Pw") + request.getParameter("chkPw"));
		out.print("两次输入密码不一致！");
		return;
	}
	else {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}
		catch(Exception e) {
			out.print("forName error: " + e);
		}
		try {
			String chkuid = request.getParameter("Uid");
			String chkpw = request.getParameter("Pw");
			String chkintro = request.getParameter("Intro");
			//out.print(chkuid + chkpw + chkintro);
			Connection con;
			Statement sql;
			con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
			sql = con.createStatement();
			if (sql.executeUpdate("INSERT INTO [jspforum].[dbo].[user] VALUES ('" + chkuid + "', '" + chkpw + "', DEFAULT, '" + chkintro + "', DEFAULT)") == 0)
				out.print("注册失败，请检查注册信息！");
		}
		catch (SQLException e) {
			out.print("SQL connection error: " + e);
		}
		out.print("注册成功！");
	}
%>