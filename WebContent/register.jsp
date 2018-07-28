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
<p2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.jsp">主页</a>&nbsp;&nbsp;&nbsp;<a href="newPost.jsp">发帖</a>&nbsp;&nbsp;&nbsp;<a href="login.jsp">退出</a></p2>
<hr>
<form action="registerCheck.jsp" method=post name=form>
	请输入用户名（8位以内英文、数字）：<br><input type="text" name="Uid">
	<br>请输入密码（16位以内）：<br><input type="password" name="Pw">
	<br>确认密码：<br><input type="password" name="chkPw">
	<br>请输入个人简介（选填）：<br><textarea name="Intro" cols="100" rows="10"></textarea>
	<br><input type="submit" name="submit" value="注册">
</form>