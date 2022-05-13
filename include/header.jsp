<%
	// 设置页面不缓存
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires", 0);
%>

<html>
<head><title> <%=title%> </title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link rel="stylesheet" href="<%=csspath%>/Jimwong.css" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

