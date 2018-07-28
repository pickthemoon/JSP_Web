<%@ tag pageEncoding="UTF-8" %>
<%@ tag import="java.sql.*"%>
<%@ attribute name="passid" required="true" %>
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
		ResultSet rs, rs2;
		con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=jspforum", "jsp_user", "jsp");
		sql = con.createStatement();
		rs = sql.executeQuery("SELECT grade FROM [jspforum].[dbo].[user] WHERE uid = '" + passid + "'");
		rs.next();
		int gra = rs.getInt(1);
		gra++;
		sql.executeUpdate("UPDATE [jspforum].[dbo].[user] SET grade = '" + gra + "' WHERE uid = '" + passid + "'");
	}
	catch(Exception e) {
		out.print(e);
	}
%>