<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 接收传递参数
	String nickname = "", passwd1 = "", realname = "", question = "", answer = "";
	nickname= request.getParameter("nickname");
	passwd1 = request.getParameter("passwd1");
	realname= new String((request.getParameter("realname")).getBytes("8859_1"),"GBK");
	question= new String((request.getParameter("question")).getBytes("8859_1"),"GBK");
	answer	= new String((request.getParameter("answer")).getBytes("8859_1"),"GBK");

	// 首先判断用户名是否重复
	sql = "select Manage_user_id, Manage_user_nick, Manage_user_pwd from gzmy_manage_user where Manage_user_nick = '" + nickname + "'";
	rsCOM = db.select(sql);

	if(rsCOM==null || rsCOM.getRows()==0) {	// 没有这个用户
		// 注册
		sql = "insert into gzmy_manage_user(Manage_user_nick, Manage_user_name, Manage_user_pwd, Manage_user_quet, Manage_user_answ, Manage_user_rdate, Manage_user_sign) values('" + nickname + "', '" + realname + "', '" + passwd1 + "', '" + question + "', '" + answer + "', getdate(), 0)";

		if(db.update(sql)!=1) {
%>

			<script language="javascript">
				alert("数据操作出错!");
				window.location = "register.jsp";
			</script>

<%
			return;
		}
%>

		<script language="javascript">
			alert("您已经成功注册管理员!\n请等待系统超级管理员审批!");
			window.location = "../index.jsp?Nicknm=<%=nickname%>";
		</script>

<%
	}
	else {
%>

		<script language="javascript">
			alert("您注册的管理员已重名!\n请重新选择管理员账号!");
			window.location = "register.jsp";
		</script>

<%
	}
%>
