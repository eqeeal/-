<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// ���մ��ݲ���
	String id = "";
	id	= request.getParameter("id");
	
	// ɾ��
	sql = "delete from JM_XZ_INDEX where Xz_index_id = " + id;

	db.update(sql);
%>
	<script language="javascript">
		alert("�ɹ�ɾ��!");
		document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
	</script>
