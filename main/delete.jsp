<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// ���մ��ݲ���
	String type = "", id = "";
	type= request.getParameter("type");
	id	= request.getParameter("id");
	
	// ɾ��
	if(type.equalsIgnoreCase("single"))
		sql = "delete from gzmy_meili_info where msgid = " + id;
	else
		sql = "delete from gzmy_meili_info";

	db.update(sql);
%>
	<script language="javascript">
		alert("�ɹ�ɾ��!");
		document.write("<meta http-equiv='refresh' content='0; url=manacon.jsp?tid=<%=tid%>'>");
	</script>
