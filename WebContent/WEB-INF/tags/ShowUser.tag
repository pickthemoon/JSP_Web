<%@ tag pageEncoding="UTF-8" %>
<%@ tag import="java.sql.*"%>
<%@ attribute name="userid" required="true" %>
<%@ variable name-given="introduction" variable-class="java.lang.String" scope="AT_END" %>
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
		rs = sql.executeQuery("SELECT uid, role, intro, grade FROM [jspforum].[dbo].[user] WHERE uid = '" + userid + "'");
		while (rs.next()) {
			out.print("用户名：" + userid + "<br>");
			String userrole = "";
			if (rs.getString(2).equals("0"))
				userrole = "管理员";
			if (rs.getString(2).equals("1"))
				userrole = "普通用户";
			out.print(userrole + "<br>");
			out.print("发帖数：" + rs.getString(4).toString() + "<br>");
			jspContext.setAttribute("introduction", rs.getString(3));
		}
	}
	catch(Exception e) {
		out.print(e);
	}
%>