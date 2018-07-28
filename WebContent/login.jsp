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
<p1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;海角论坛</p1>
<hr>
<%	
	//session.invalidate();
	session.removeAttribute("userid");
	session.removeAttribute("password");
	session.removeAttribute("userrole");
	session.removeAttribute("userintro");
	session.removeAttribute("usergrade");
%>
<html>
<body bgcolor=cyan>
	<div align="center">
	<font size=3>
		<form action="loginCheck.jsp" method=post name=form>
			<br><br><br><br>用户名：<input type="text" name="Uid">
			 <br><br>&nbsp;&nbsp;&nbsp;&nbsp;密码：<input type="password" name="Pw">
			 <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="登录">
		</form>
		<form action="register.jsp" method=post name=form>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="注册新账号">
		</form>
	</font>
	</div>
</body>
</html>