<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	String title	= "成绩管理注册表管理 - 内容修改";
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
		    <b><font color="red"><%=area%></font></b>&nbsp;|&nbsp;内容修改&nbsp;&nbsp;<a href="javascript:history.back();" class="black">返回操作</a>&nbsp;&nbsp;[仅限于内容修改]</a>			
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
	// 取出信息参数
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
					    <td class="white">&nbsp;&gt;&nbsp;『成绩管理』&nbsp;-&nbsp;信息修改</td>
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
								  学号：<textarea name="xuehao" rows="1" cols="45"><%=xgnr%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">

							  
							  <tr height="22">
								<td colspan="2" class="black">
								  成绩：<textarea name="content" rows="1" cols="45"><%=xgnr1%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">

                             <tr height="22">
								<td colspan="2" class="black">
								  姓名：<textarea name="content1" rows="1" cols="45"><%=xgnr2%></textarea>
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2" class="black">




								  日期：<input type="text" name="usedate" value="<%=xgrq%>" size="16">
								</td>
							  </tr>
							  <tr height="22">
								<td colspan="2">
								  <input type="hidden" name="id" value="<%=id%>">
								  <input type="hidden" name="olduse" value="<%=xgrq%>">
                            
								  <input type="hidden" name="tid" value="<%=tid%>">
								  <input type="submit" name="csmdy" value="保存修改" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="重新填写" class="sig_b_login">
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
