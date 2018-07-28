<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="show"%>
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
			//out.print(request.getParameter("postid"));
			rs = sql.executeQuery("SELECT writer, pdate, title, detail FROM [jspforum].[dbo].[post] WHERE pid = '" + request.getParameter("postid") + "'");
			rs.next();
	%>		<table border=1>
				<tr>
					<td rowspan="5" width=200>
						<show:ShowUser userid="<%=rs.getString(1)%>"/>
					</td>
					<td width=800><b><%=rs.getString(3)%></b></td>
				<tr>
				<tr>
					<td height=100><%=rs.getString(4)%></td>
				<tr>
				<tr>
					<td><font size=2><%=introduction%></font></td>
				<tr>
			<table><br>
	<%		Statement sql2;
			ResultSet rs2;
			sql2 = con.createStatement();
			//out.print(request.getParameter("postid"));
			rs2 = sql2.executeQuery("SELECT writer, pdate, title, detail FROM [jspforum].[dbo].[post] WHERE fid = '" + request.getParameter("postid") + "' ORDER BY pdate ASC");
			while (rs2.next()) {
	%>		<table border=1>
				<tr>
					<td rowspan="5" width=200>
						<show:ShowUser userid="<%=rs2.getString(1)%>"/>
					</td>
					<td width=800 height=100><%=rs2.getString(4)%></td>
				<tr>
				<tr>
					<td><font size=2><%=introduction%></font></td>
				<tr>
				<table><br>
	<%		}
		}
		catch (SQLException e) {
			out.print("SQL connection error: " + e);
		}
	%>
	<form action="checkComment.jsp" method=post name=form>
		<br>发表评论：<br><textarea name="Detail" cols="100" rows="10"></textarea>
		<br>使用个性签名<input type="checkbox" name="Intro" value="checked" checked="checked">
		<br><input type="submit" name="submit" value="发送">
		<input type="hidden" name="postid" value=<%=request.getParameter("postid")%>>
	</form>
</body>
</html>