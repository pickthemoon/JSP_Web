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
		Date datenow = new Date();
		out.print("欢迎来到海角论坛，" + session.getAttribute("userid") + "！<br>您的登陆时间：" + datenow + "。");
	%>
	<form  action="byTitle.jsp" method=post name=form>
		<input type="text" name="byTitle">
		<input type="submit" name="submit" value="搜索">
	</form>
	<%
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}
		catch(Exception e) {
			out.print("forName error: " + e);
		}
		try {
			Connection con;
			Statement sql;
			ResultSet rs;
			con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
			sql = con.createStatement();
			rs = sql.executeQuery("SELECT writer, pdate, title, pid FROM [jspforum].[dbo].[post] WHERE fid = '' ORDER BY pdate DESC");
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