<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%!
	String title	= "�ɼ�����ע������ - ����ά��";
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
          <td height="22" class="black">
		    ����ά��&nbsp;&nbsp;
<%
	int tid = 1;
	String title_tip = "", fName = "";
	if(hashReq.containsKey("tid")) tid = Integer.parseInt(request.getParameter("tid"));
	if(tid == 1) {
		title_tip = "��Ϣǰ׺";
		fName = "gzmyq.txt";
		out.println("<font color=\"" + Bgtitle + "\"><b>��Ϣǰ׺</b></font>&nbsp;-&nbsp;<a href=\"javascript:window.location='wftxt.jsp?tid=2'\" class=\"black\">��Ϣ��׺</a>");
	}
	if(tid == 2) {
		title_tip = "��Ϣ��׺";
		fName = "gzmyh.txt";
		out.println("<a href=\"javascript:window.location='wftxt.jsp?tid=1'\" class=\"black\">��Ϣǰ׺</a>&nbsp;-&nbsp;<font color=\"" + Bgtitle + "\"><b>��Ϣ��׺</b></font>");
	}
%>
			
		  </td>
        </tr>
		<tr> 
          <td>&nbsp;</td>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="<%=Bground%>">
			  <tr>
			    <td height="18">
				  <hr noshade width="100%" size="1" color="#000000">
				</td>
			  </tr>
			  <form name="ftxt" action="rltxt.jsp" method="post">
			  <tr>
			    <td height="22" bgcolor="<%=Bgtitle%>" class="white"><%=title_tip%>&nbsp;&nbsp;�ı�ά��[ÿ�����ʹ�ûس�]</td>
			  </tr>
			  <tr>
			    <td><textarea name="content" rows="8" cols="64">
<%
	// ��ȡ���ݲ���ʾ
	fName = request.getRealPath("") + "\\txt\\" + fName;
	FileReader fr = new FileReader(fName);
	BufferedReader br = new BufferedReader(fr);
	String Line = br.readLine();
	while(Line != null) {
		out.println(Line);
		Line = br.readLine();
	}
	br.close();
	fr.close();
%>
				</textarea></td>
			  </tr>
			  <tr>
			    <td height="12"></td>
			  </tr>
			  <tr>
			    <td height="22">
				  <input type="hidden" name="tid" value="<%=tid%>">
				  <input type="submit" name="wftxt" value="�����ı�" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="������д" class="sig_b_login">
				</td>
			  </tr>
			  </form>
			  <tr>
			    <td height="18">
				  <hr noshade width="100%" size="1" color="#000000">
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
      </table>
    </td>
  </tr>
</table>

<%@ include file = "../include/footer.jsp" %>
