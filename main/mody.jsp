<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	String title	= "�ɼ�����ע������ - �����޸�";
	String csspath	= "../include";

	String id = "", xgnr = "",xgnr1 = "",xgnr2 = "" ,xgrq = "";
	id	= request.getParameter("id");
%>
<%@ include file = "../include/conn.jsp" %>
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
		    <b><font color="red"><%=area%></font></b>&nbsp;|&nbsp;�����޸�&nbsp;&nbsp;<a href="javascript:history.back();" class="black">���ز���</a>&nbsp;&nbsp;[�����������޸�]</a>			
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
			  <tr>
			    <td>
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
	// ȡ����Ϣ����
	sql = "select xuehao,content,name, usedate from gzmy_meili_info where msgid = " + id;
	rsCOM = db.select(sql);

	if(rsCOM.getRows()!=0)
		xgnr = rsCOM.get(0,0);
        xgnr1 = rsCOM.get(0,1);
		xgnr2 = rsCOM.get(0,2);
		xgrq = rsCOM.get(0,3);

		if (xgrq != null && !xgrq.equals("null") && !xgrq.equals(""))
			xgrq = xgrq.substring(0, 10);
		else
			xgrq = "";
%>
					  <tr bgcolor="<%=Bgtitle%>" height="22">
					    <td class="white">&nbsp;&gt;&nbsp;���ɼ�����&nbsp;-&nbsp;��Ϣ�޸�</td>
					  </tr>
					  <tr>
					    <td height="12"></td>
					  </tr>
					  <tr>
					    <td>
						  <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
							<form name="myform3" action="rltmody.jsp" method="post" onsubmit="javascript:return chkcsmdy();">
							 

                             <tr height="22">
								<td colspan="2" class="black">
								  ѧ�ţ�<textarea name="xuehao" rows="1" cols="45"><%=xgnr%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">

							  
							  <tr height="22">
								<td colspan="2" class="black">
								  �ɼ���<textarea name="content" rows="1" cols="45"><%=xgnr1%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">

                             <tr height="22">
								<td colspan="2" class="black">
								  ������<textarea name="content1" rows="1" cols="45"><%=xgnr2%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">




								  ���ڣ�<input type="text" name="usedate" value="<%=xgrq%>" size="16">
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2">
								  <input type="hidden" name="id" value="<%=id%>">
								  <input type="hidden" name="olduse" value="<%=xgrq%>">
                            
								  <input type="hidden" name="tid" value="<%=tid%>">
								  <input type="submit" name="csmdy" value="�����޸�" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="������д" class="sig_b_login">
								</td>
							  </tr>
							</form>
						  </table>
					    </td>
					  </tr>				    
				  </table>
				</td>
			  </tr>
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
