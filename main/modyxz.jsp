<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	String title	= "�����˳�ע������ - �����޸�";
	String csspath	= "../include";

	String id = "", xgnr = "";
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
	sql = "select Xz_index_cont from JM_XZ_INDEX where Xz_index_id = " + id;
	rsCOM = db.select(sql);

	if(rsCOM.getRows()!=0)
		xgnr = rsCOM.get(0, 0);
%>
					  <tr bgcolor="<%=Bgtitle%>" height="22">
					    <td class="white">&nbsp;&gt;&nbsp;�������˳̡�&nbsp;-&nbsp;��Ϣ�޸�</td>
					  </tr>
					  <tr>
					    <td height="12"></td>
					  </tr>
					  <tr>
					    <td>
						  <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">
							<form name="myform3" action="rltmodyxz.jsp" method="post" onsubmit="javascript:return chkcsmdy();">
							  <tr height="22">
								<td colspan="2" class="black">
								  ���ݣ�<textarea name="content" rows="4" cols="64"><%=xgnr%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2">
								  <input type="hidden" name="id" value="<%=id%>">
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
