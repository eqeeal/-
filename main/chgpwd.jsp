<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ���մ��ݲ���
	String nowpwd = "", newpwd = "";
	nowpwd = request.getParameter("nowpwd");
	newpwd = request.getParameter("newpwd");

	// �жϵ�ǰ�����Ƿ���ȷ
	sql = "select Manage_user_nick from gzmy_manage_user where Manage_user_pwd = '" + nowpwd + "' and Manage_user_id = " + intID;
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// ����
%>

		<script language="javascript">
			alert("���������������!\n��������д�޸�!");
			window.location = "chgpass.jsp";
		</script>

<%
	}
	else {
		// �޸��û�����
		sql = "update gzmy_manage_user set Manage_user_pwd = '" + newpwd + "' where Manage_user_id = " + intID;

		if(db.update(sql)!=1) {	// ����
%>
		
			<script language="javascript">
				alert("�����޸Ĵ���!\n����ϵ��������Ա!");
				window.location = "chgpass.jsp";
			</script>

<%
		}
		else {
%>

			<script language="javascript">
				alert("�ɹ��޸Ĺ���Ա����!");
				window.location = "chgpass.jsp";
			</script>

<%
		}
	}
%>
