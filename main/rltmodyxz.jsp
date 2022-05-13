<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// 接收传递参数
	String id = "";
	id	= request.getParameter("id");

	String xgnr = "";
	xgnr = new String((request.getParameter("content")).getBytes("8859_1"),"GBK");

	sql = "update JM_XZ_INDEX set Xz_index_cont = '" + xgnr + "' where Xz_index_id = " + id;
		
	if(db.update(sql)==-1) {	// 错误		
%>	
		<script language="javascript">
			alert("数据操作出错!");
			document.write("<meta http-equiv='refresh' content='0; url=modyxz.jsp?tid=<%=tid%>&id=<%=id%>'>");
		</script>
<%
	}
	else {
%>
		<script language="javascript">
			alert("成功修改内容!");
			document.write("<meta http-equiv='refresh' content='0; url=modyxz.jsp?tid=<%=tid%>&id=<%=id%>'>");
		</script>
<%
	}
%>
