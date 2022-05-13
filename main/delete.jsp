<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// 接收传递参数
	String type = "", id = "";
	type= request.getParameter("type");
	id	= request.getParameter("id");
	
	// 删除
	if(type.equalsIgnoreCase("single"))
		sql = "delete from gzmy_meili_info where msgid = " + id;
	else
		sql = "delete from gzmy_meili_info";

	db.update(sql);
%>
	<script language="javascript">
		alert("成功删除!");
		document.write("<meta http-equiv='refresh' content='0; url=manacon.jsp?tid=<%=tid%>'>");
	</script>
