<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// ���մ��ݲ���
	String id = "";
	id	= request.getParameter("id");

	String xgnr = "";
	xgnr = new String((request.getParameter("content")).getBytes("8859_1"),"GBK");

	sql = "update JM_XZ_INDEX set Xz_index_cont = '" + xgnr + "' where Xz_index_id = " + id;
		
	if(db.update(sql)==-1) {	// ����		
%>	
		<script language="javascript">
			alert("���ݲ�������!");
			document.write("<meta http-equiv='refresh' content='0; url=modyxz.jsp?tid=<%=tid%>&id=<%=id%>'>");
		</script>
<%
	}
	else {
%>
		<script language="javascript">
			alert("�ɹ��޸�����!");
			document.write("<meta http-equiv='refresh' content='0; url=modyxz.jsp?tid=<%=tid%>&id=<%=id%>'>");
		</script>
<%
	}
%>
