<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%!
	String title	= "�ɼ�����ע������ - Ȩ�޹���";
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
          <td height="22" class="black">Ȩ�޹���</td>
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
			    <td height="22" width="9%" class="white">����Ա�˺�</td>
				<td height="22" width="9%" class="white">����Ա����</td>
				<td height="22" width="16%" class="white">�ϴε�½ʱ��</td>
				<td height="22" width="20%" class="white">����Ȩ��</td>				
				<td height="22" width="36%" class="white">��Ȩ���Ʋ���</td>
			  </tr>
<%
	// ��ҳ��ʾ��¼
	int num = 0;
	int curPage	= 1;
	int maxPage, maxRowCount;

	// ��ǰҳ��
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

			// �жϹ���Ȩ��
			ptip = "";zauth = "";cauth = "";tauth = "";kauth = "";
			zauth = rsCOM.get(i, 4);
			if(zauth.indexOf("1") != -1) {ptip += "[����ϵͳ]";cauth = "checked";}
			if(zauth.indexOf("2") != -1) {ptip += "[��ɢ��ѧ]";tauth = "checked";}
			if(ptip.equals(""))	ptip = "[��Ȩ��]";
			out.println("<td>" + ptip + "</td>");

			// ��Ȩ����
			out.println("<form name=\"FormMody\" method=\"post\" action=\"chgppd.jsp\"><td>");
			out.println("<input type=\"checkbox\" name=\"chk1\" value=\"on\" " + cauth + ">����ϵͳ");
			out.println("<input type=\"checkbox\" name=\"chk2\" value=\"on\" " + tauth + ">��ɢ��ѧ");
			out.println("<input type=\"hidden\" name=\"IntID\" value=\"" + rsCOM.get(i, 0) + "\">");
			out.println("<input type=\"submit\" name=\"ModyUserAuth\" value=\"����Ȩ��\" class=\"sig_b_login\">&nbsp;&nbsp;<a href=\"javascript:if(confirm('ȷ��ɾ����?')) window.location='chgppd.jsp?IntID=" + rsCOM.get(i, 0) + "';\" class=\"black\">ɾ��</a>");
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
				    ��<%=maxRowCount%>�м�¼/ÿҳ<%=iPageLenI%>�м�¼&nbsp;&nbsp;&nbsp;&nbsp;
��<%=maxPage%>ҳ/��<%=curPage%>ҳ&nbsp;&nbsp;&nbsp;&nbsp;
<%
	if(curPage==1)
		out.print("����һҳ������һҳ��");
	else {
%>
��<a href="javascript:gotoPage(1)" class="black">��һҳ</a>����<a href="javascript:gotoPage(<%=curPage-1%>)" class="black">��һҳ</a>��
<%
	}
	
	if(curPage==maxPage)
		out.print("����һҳ��&nbsp;�����ҳ��");
	else {
%>
��<a href="javascript:gotoPage(<%=curPage+1%>)" class="black">��һҳ</a>��
��<a href="javascript:gotoPage(<%=maxPage%>)" class="black">���ҳ</a>��
<%
	}
%>
&nbsp;&nbsp;ת����
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
ҳ

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

