<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ���մ��ݲ���
	String nickname = "", passwd = "";
	nickname= request.getParameter("nickname");
	passwd = request.getParameter("passwd1");

	// �ж��û������Ƿ���ȷ��¼
	sql = "delete from gzmy_manage_user where Manage_user_nick = '" + nickname + "' and Manage_user_pwd = '" + passwd + "'";

	if(db.update(sql)!=1) {	// ����
%>
		
		<script language="javascript">
			alert("δ��ע������Ա, ��ȷ���û����������Ƿ���ȷ!");
			window.location = "deluid.jsp";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("�ɹ�ע������Ա: <%=nickname%>");
			window.location = "../index.jsp";
		</script>

<%
	}
%>
