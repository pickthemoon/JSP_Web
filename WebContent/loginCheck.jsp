<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showinfo" %>
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
<p2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.jsp">主页</a>&nbsp;&nbsp;&nbsp;<a href="newPost.jsp">发帖</a>&nbsp;&nbsp;&nbsp;<a href="login.jsp">退出</a></p2>
<hr>
<br><br><br><br><br><div align="center">
<%
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch(Exception e) {
		out.print("forName error: " + e);
	}
	try {
		String chkuid = request.getParameter("Uid");
		String chkpw = request.getParameter("Pw");
		//out.print(chkuid + chkpw);
		Connection con;
		Statement sql;
		ResultSet rs;
		con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
		sql = con.createStatement();
		rs = sql.executeQuery("SELECT * FROM [jspforum].[dbo].[user] WHERE uid = '" + chkuid + 
			"' AND pw = '" + chkpw + "'");
		if (!rs.next()) {
			out.print("用户名或密码错误！");
		}
		else {
			out.print("登陆成功！" + "<br>" + "您的信息：" + "<br>" + "<br>");
			session.setAttribute("userid", rs.getString(1));
			session.setAttribute("password", rs.getString(2));
			session.setAttribute("userrole", rs.getString(3));
			session.setAttribute("userintro", rs.getString(4));
			session.setAttribute("usergrade", rs.getString(5));
			//out.print(rs.getString(4));
%>			<jsp:include page="showUser.jsp"/>
			<html>
				<body>
					<form action="main.jsp" mothod=post name=form>
						<br><input type=submit name="submit" value="进入主页">
					</form>
				</body>
			</html>
<%		}
	}
	catch (SQLException e) {
		out.print("SQL connection error: " + e);
	}
%>
</div>