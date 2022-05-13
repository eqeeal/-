<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 接收传递参数
	String nickname = "", question = "", answer = "";
	nickname= request.getParameter("nickname");
	question= new String((request.getParameter("question")).getBytes("8859_1"),"GBK");
	answer	= new String((request.getParameter("answer")).getBytes("8859_1"),"GBK");

	// 判断用户输入是否正确记录
	sql = "select Manage_user_nick, Manage_user_pwd from gzmy_manage_user where Manage_user_nick = '" + nickname + "' and Manage_user_quet = '" + question + "' and Manage_user_answ = '" + answer + "'";
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// 错误
%>
		
		<script language="javascript">
			alert("未找到正确密码!\n请确认输入是否正确或联系超级管理员!");
			window.location = "getpass.jsp";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("成功取回管理员密码!\n用户名: <%=rsCOM.get(0, 0)%>\n密码: <%=rsCOM.get(0, 1)%>");
			window.location = "../index.jsp?Nicknm=<%=nickname%>";
		</script>

<%
	}
%>
