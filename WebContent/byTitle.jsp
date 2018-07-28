<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showrole"%>
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
<html>
<body bgcolor=cyan>
	<%
	request.setCharacterEncoding("UTF-8");
	if (request.getParameter("byTitle") == "") {
		out.print("请输入关键字！");
		return;
	}
	out.print("搜索结果：<br>");
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}
		catch(Exception e) {
			out.print("forName error: " + e);
		}
		try {
			//out.print(request.getParameter("byTitle"));
			Connection con;
			Statement sql;
			ResultSet rs;
			con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
			sql = con.createStatement();
			rs = sql.executeQuery("SELECT writer, pdate, title, pid FROM [jspforum].[dbo].[post] WHERE title LIKE '%" + request.getParameter("byTitle") + "%'");
			while (rs.next()) {
				String color = "black";
	%>			<showrole:ShowRole userid="<%=rs.getString(1)%>"/>
	<%			if (showuserrole.equals("0"))
								color = "blue";
	%>			<br><table border="1" >
					<tr>
						<td colspan=2 width=800px>主题：<b><font color=<%=color%>><%=rs.getString(3)%></font></b></td>
						<td rowspan=2>
							<form action="onePost.jsp" method=post name=form>
								<input type="submit" name="enter" value="进入">
								<%//out.print(rs.getString(4));%>
								<input type="hidden" name="postid" value="<%=rs.getString(4)%>">
							</form>
						</td>
					</tr>
					<tr>
						<td width=300>发帖人：<%=rs.getString(1)%></td>
						<td>发帖时间：<%=rs.getTimestamp(2).toString()%></td>
					</tr>
				</table>
	<%		}
		}
		catch (SQLException e) {
			out.print("SQL connection error: " + e);
		}
	%>
</body>
</html>