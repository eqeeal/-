<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ���մ��ݲ���
	String nickname = "", question = "", answer = "";
	nickname= request.getParameter("nickname");
	question= new String((request.getParameter("question")).getBytes("8859_1"),"GBK");
	answer	= new String((request.getParameter("answer")).getBytes("8859_1"),"GBK");

	// �ж��û������Ƿ���ȷ��¼
	sql = "select Manage_user_nick, Manage_user_pwd from gzmy_manage_user where Manage_user_nick = '" + nickname + "' and Manage_user_quet = '" + question + "' and Manage_user_answ = '" + answer + "'";
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// ����
%>
		
		<script language="javascript">
			alert("δ�ҵ���ȷ����!\n��ȷ�������Ƿ���ȷ����ϵ��������Ա!");
			window.location = "getpass.jsp";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("�ɹ�ȡ�ع���Ա����!\n�û���: <%=rsCOM.get(0, 0)%>\n����: <%=rsCOM.get(0, 1)%>");
			window.location = "../index.jsp?Nicknm=<%=nickname%>";
		</script>

<%
	}
%>
