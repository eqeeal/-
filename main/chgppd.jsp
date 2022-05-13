<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 更改权限
	String IntID = "";
	if(hashReq.containsKey("ModyUserAuth")) {
		// 先删除原有权限
		IntID = request.getParameter("IntID");
		sql = "update gzmy_manage_user set Manage_user_sign = 0 where Manage_user_id = " + IntID;

		if(db.update(sql)!=1) {	// 数据操作出错
%>

			<script language="javascript">
				alert("数据操作出错!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}

		// 再插入新的权限
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

			if(db.update(sql)!=1) {	// 数据操作出错
%>

				<script language="javascript">
					alert("数据操作出错!");
					document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
				</script>

<%
				return;
			}
			else {
%>

				<script language="javascript">
					alert("成功修改权限!");
					document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
				</script>

<%
				return;
			}
		}
	}
	else {
		// 删除用户
		IntID = request.getParameter("IntID");
		sql = "delete from gzmy_manage_user where Manage_user_id = " + IntID;

		if(db.update(sql)!=1) {	// 数据操作出错
%>

			<script language="javascript">
				alert("数据操作出错!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}
		else {
%>

			<script language="javascript">
				alert("成功修改权限!");
				document.write("<meta http-equiv='refresh' content='0; url=popedom.jsp'>");
			</script>

<%
			return;
		}
	}
%>

