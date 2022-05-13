<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 接收传递参数
	String nowpwd = "", newpwd = "";
	nowpwd = request.getParameter("nowpwd");
	newpwd = request.getParameter("newpwd");

	// 判断当前密码是否正确
	sql = "select Manage_user_nick from gzmy_manage_user where Manage_user_pwd = '" + nowpwd + "' and Manage_user_id = " + intID;
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// 错误
%>

		<script language="javascript">
			alert("您的密码输入错误!\n请重新填写修改!");
			window.location = "chgpass.jsp";
		</script>

<%
	}
	else {
		// 修改用户密码
		sql = "update gzmy_manage_user set Manage_user_pwd = '" + newpwd + "' where Manage_user_id = " + intID;

		if(db.update(sql)!=1) {	// 错误
%>
		
			<script language="javascript">
				alert("密码修改错误!\n请联系超级管理员!");
				window.location = "chgpass.jsp";
			</script>

<%
		}
		else {
%>

			<script language="javascript">
				alert("成功修改管理员密码!");
				window.location = "chgpass.jsp";
			</script>

<%
		}
	}
%>
