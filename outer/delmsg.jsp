<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 接收传递参数
	String nickname = "", passwd = "";
	nickname= request.getParameter("nickname");
	passwd = request.getParameter("passwd1");

	// 判断用户输入是否正确记录
	sql = "delete from gzmy_manage_user where Manage_user_nick = '" + nickname + "' and Manage_user_pwd = '" + passwd + "'";

	if(db.update(sql)!=1) {	// 错误
%>
		
		<script language="javascript">
			alert("未能注销管理员, 请确认用户名或密码是否正确!");
			window.location = "deluid.jsp";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("成功注销管理员: <%=nickname%>");
			window.location = "../index.jsp";
		</script>

<%
	}
%>
