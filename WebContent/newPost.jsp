<%@ page contentType="text/html;charset=UTF-8"%>
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
	<font size=3>
		<form action="checkPost.jsp" method=post name=form>
			请输入标题：<br><input type="text" name="Title" size="135"><br>
			请输入内容：<br><textarea name="Detail" cols="100" rows="10"></textarea>
			<br>使用个性签名<input type="checkbox" name="Intro" value="checked" checked="checked">
			<br><input type="submit" name="submit" value="发帖">
		</form>
	</font>
</body>
</html>