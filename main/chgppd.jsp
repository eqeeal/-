<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ����Ȩ��
	String IntID = "";
	if(hashReq.containsKey("ModyUserAuth")) {
		// ��ɾ��ԭ��Ȩ��
		IntID = request.getParameter("IntID");
		sql = "update gzmy_manage_user set Manage_user_sign = 0 where Manage_user_id = " + IntID;

		if(db.update(sql)!=1) {	// ���ݲ�������
%>

			<script language="javascript">
				alert("���ݲ�������!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}

		// �ٲ����µ�Ȩ��
		String strAuth = "";
		Enumeration enumElements = request.getParameterNames();
		while(enumElements.hasMoreElements()) {
			Object strKey	= enumElements.nextElement();
			String strEname	= strKey.toString();
			String strChkBox= strEname.substring(0, 3);
			if(strChkBox.compareTo("chk") != 0) continue;

			strAuth += strEname.substring(3);
		}
		if(strAuth.length() > 0) {
			sql = "update gzmy_manage_user set Manage_user_sign = " + strAuth + " where Manage_user_id = " + IntID;

			if(db.update(sql)!=1) {	// ���ݲ�������
%>

				<script language="javascript">
					alert("���ݲ�������!");
					document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
				</script>

<%
				return;
			}
			else {
%>

				<script language="javascript">
					alert("�ɹ��޸�Ȩ��!");
					document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
				</script>

<%
				return;
			}
		}
	}
	else {
		// ɾ���û�
		IntID = request.getParameter("IntID");
		sql = "delete from gzmy_manage_user where Manage_user_id = " + IntID;

		if(db.update(sql)!=1) {	// ���ݲ�������
%>

			<script language="javascript">
				alert("���ݲ�������!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}
		else {
%>

			<script language="javascript">
				alert("�ɹ��޸�Ȩ��!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}
	}
%>

