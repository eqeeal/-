<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ���մ��ݲ���
	String nickname = "", passwd1 = "", realname = "", question = "", answer = "";
	nickname= request.getParameter("nickname");
	passwd1 = request.getParameter("passwd1");
	realname= new String((request.getParameter("realname")).getBytes("8859_1"),"GBK");
	question= new String((request.getParameter("question")).getBytes("8859_1"),"GBK");
	answer	= new String((request.getParameter("answer")).getBytes("8859_1"),"GBK");

	// �����ж��û����Ƿ��ظ�
	sql = "select Manage_user_id, Manage_user_nick, Manage_user_pwd from gzmy_manage_user where Manage_user_nick = '" + nickname + "'";
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// û������û�
		// ע��
		sql = "insert into gzmy_manage_user(Manage_user_nick, Manage_user_name, Manage_user_pwd, Manage_user_quet, Manage_user_answ, Manage_user_rdate, Manage_user_sign) values('" + nickname + "', '" + realname + "', '" + passwd1 + "', '" + question + "', '" + answer + "', getdate(), 0)";

		if(db.update(sql)!=1) {
%>

			<script language="javascript">
				alert("���ݲ�������!");
				window.location = "register.jsp";
			</script>

<%
			return;
		}
%>

		<script language="javascript">
			alert("���Ѿ��ɹ�ע�����Ա!\n��ȴ�ϵͳ��������Ա����!");
			window.location = "../index.jsp?Nicknm=<%=nickname%>";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("��ע��Ĺ���Ա������!\n������ѡ�����Ա�˺�!");
			window.location = "register.jsp";
		</script>

<%
	}
%>
