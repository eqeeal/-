<%@ page contentType="text/html;charset=gb2312"%>
<html>

<head>
<title> Error Page </title>
</head>

<%@ page isErrorPage="true" %>

<body text="#ff0000" link="#0000ff" vlink="#00ffff" bgcolor="#0082bc">
<center>
<br>
<h2> 您的请求出现错误... </h2>

<br><br><br>
错误信息: <br>

<%= exception.toString() %> <br>
<br>
<a href="javascript:history.back()">返回</a>
</center>

</body>
</html>
