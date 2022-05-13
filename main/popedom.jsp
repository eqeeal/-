<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%!
	String title	= "成绩管理注册表管理 - 权限管理";
	String csspath	= "../include";
%>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/const.jsp" %>

<script language="javascript" src="../include/zb.js"></script>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td valign="top">
      <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="10" colspan="2"></td>
        </tr>
        <tr> 
          <td height="22" width="27" class="black">&gt;&gt;</td>
          <td height="22" class="black">权限管理</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="<%=Bground%>">
			  <tr>
			    <td height="18" colspan="5">
				  <hr noshade width="100%" size="1" color="#000000">
				</td>
			  </tr>
			  <tr bgcolor="<%=Bgtitle%>" align="center">
			    <td height="22" width="9%" class="white">管理员账号</td>
				<td height="22" width="9%" class="white">管理员姓名</td>
				<td height="22" width="16%" class="white">上次登陆时间</td>
				<td height="22" width="20%" class="white">管理权限</td>				
				<td height="22" width="36%" class="white">授权控制操作</td>
			  </tr>
<%
	// 分页显示记录
	int num = 0;
	int curPage	= 1;
	int maxPage, maxRowCount;

	// 当前页面
	String jumpPage = request.getParameter("jumpPage");
	if(jumpPage != null && !jumpPage.equals("null")) curPage = Integer.parseInt(jumpPage);

	sql	= "select Manage_user_id, Manage_user_nick, Manage_user_name, Manage_user_rdate, Manage_user_sign from gzmy_manage_user order by Manage_user_id desc";
	rsCOM = db.select(sql, curPage - 1, iPageLenI);

	maxRowCount = rsCOM.getTotal();
	if(maxRowCount % iPageLenI == 0)
		maxPage = maxRowCount / iPageLenI;
	else
		maxPage = maxRowCount / iPageLenI + 1;
	num = rsCOM.getRows();

	if(rsCOM.getRows()!=0) {
		String ptip = "", zauth = "", cauth = "", tauth = "", kauth = "";
		for(int i=0; i<num; i++) {
			out.println("<tr height=\"22\" bgcolor=\"" + Bgworks + "\">");
			out.println("<td align=\"center\">" + rsCOM.get(i, 1) + "</td>");
			out.println("<td align=\"center\">" + rsCOM.get(i, 2) + "</td>");
			out.println("<td align=\"center\">" + rsCOM.get(i, 3).substring(0, 16) + "</td>");

			// 判断管理权限
			ptip = "";zauth = "";cauth = "";tauth = "";kauth = "";
			zauth = rsCOM.get(i, 4);
			if(zauth.indexOf("1") != -1) {ptip += "[操作系统]";cauth = "checked";}
			if(zauth.indexOf("2") != -1) {ptip += "[离散数学]";tauth = "checked";}
			if(ptip.equals(""))	ptip = "[无权限]";
			out.println("<td>" + ptip + "</td>");

			// 授权操作
			out.println("<form name=\"FormMody\" method=\"post\" action=\"chgppd.jsp\"><td>");
			out.println("<input type=\"checkbox\" name=\"chk1\" value=\"on\" " + cauth + ">操作系统");
			out.println("<input type=\"checkbox\" name=\"chk2\" value=\"on\" " + tauth + ">离散数学");
			out.println("<input type=\"hidden\" name=\"IntID\" value=\"" + rsCOM.get(i, 0) + "\">");
			out.println("<input type=\"submit\" name=\"ModyUserAuth\" value=\"更改权限\" class=\"sig_b_login\">&nbsp;&nbsp;<a href=\"javascript:if(confirm('确认删除吗?')) window.location='chgppd.jsp?IntID=" + rsCOM.get(i, 0) + "';\" class=\"black\">删除</a>");
			out.println("</td></form>");

			out.println("</tr>");
		}
	}
%>
			  <tr>
			    <td height="18" colspan="5">
				  <hr noshade width="100%" size="1" color="#000000">
				</td>
			  </tr>
<%
	if(maxPage > 1) {
%>
			  <tr height="20">
			    <td colspan="5" class="black">
				  <form name="PageForm" action="popedom.jsp" method="post">
				    共<%=maxRowCount%>行记录/每页<%=iPageLenI%>行记录&nbsp;&nbsp;&nbsp;&nbsp;
共<%=maxPage%>页/第<%=curPage%>页&nbsp;&nbsp;&nbsp;&nbsp;
<%
	if(curPage==1)
		out.print("『第一页』『上一页』");
	else {
%>
『<a href="javascript:gotoPage(1)" class="black">第一页</a>』『<a href="javascript:gotoPage(<%=curPage-1%>)" class="black">上一页</a>』
<%
	}
	
	if(curPage==maxPage)
		out.print("『下一页』&nbsp;『最后页』");
	else {
%>
『<a href="javascript:gotoPage(<%=curPage+1%>)" class="black">下一页</a>』
『<a href="javascript:gotoPage(<%=maxPage%>)" class="black">最后页</a>』
<%
	}
%>
&nbsp;&nbsp;转到第
<select name="jumpPage" onchange="Jumping()">
<%
	for(int i=1;i<=maxPage;i++) {
		if(i== curPage) {
%>
	<option selected value=<%=i%>><%=i%></option>
<%
		}
		else {
%>
	<option value=<%=i%>><%=i%></option>
<%
		}
	}
%>
</select>
页

			      </form>
				</td>
			  </tr>
<%
	}
%>
			</table>
          </td>
        </tr>
        <tr> 
          <td height="10" colspan="2"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<%@ include file = "../include/footer.jsp" %>

