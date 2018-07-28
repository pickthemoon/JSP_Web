<%@ tag pageEncoding="UTF-8" %>
<%@ tag import="java.sql.*"%>
<%@ attribute name="userid" required="true" %>
<%@ variable name-given="showuserrole" variable-class="java.lang.String" scope="AT_END" %>
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
		rs = sql.executeQuery("SELECT role FROM [jspforum].[dbo].[user] WHERE uid = '" + userid + "'");
		rs.next();
		jspContext.setAttribute("showuserrole", rs.getString(1));
	}
	catch(Exception e) {
		out.print(e);
	}
%>