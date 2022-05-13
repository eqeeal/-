<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// 接收传递参数
	String id = "";
	id	= request.getParameter("id");
	
	// 删除
	sql = "delete from JM_XZ_INDEX where Xz_index_id = " + id;

	db.update(sql);
%>
	<script language="javascript">
		alert("成功删除!");
		document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
	</script>
