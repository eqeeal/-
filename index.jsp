<%@ page contentType="text/html;charset=gb2312" %>
<%@ page errorPage="error.jsp" %>
<%@ page import = "java.util.*" %>
<%
	String title	= "成绩管理注册表管理";
	String csspath	= "./include";
	String Nicknm	= "";

	// 保存传递参数
	Enumeration enum = request.getParameterNames();
	Hashtable hashReq= new Hashtable();
	while(enum.hasMoreElements()) {
		Object strKey=enum.nextElement();
		hashReq.put(strKey, request.getParameter(strKey.toString()));
	}

	if(hashReq.containsKey("Nicknm"))
		Nicknm = request.getParameter("Nicknm");
	else
		Nicknm = "";
%>
<%@ include file = "./include/header.jsp" %>
<%@ include file = "./include/const.jsp" %>

<script language="javascript" src="./include/zb.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
      <table width="480" border="0" cellspacing="0" cellpadding="0" align="center" height="240" bgcolor="<%=Bground%>">
        <tr>
          <td height="24">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="<%=Bgtitle%>"> 
                <td rowspan="2" width="60">&nbsp;</td>
                <td height="24" class="white"><b>系统管理</b> - 成绩管理注册表</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td height="20">&nbsp; </td>
        </tr>
        <tr> 
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="136">
              <tr> 
                <td width="60">&nbsp;</td>
                <td bgcolor="<%=Bgindex%>"> 
                  <table width="320" border="0" cellspacing="0" cellpadding="0" align="center">
				   <form name="FormLogin" method="post" action="main/main.jsp" onSubmit="return submit_login();">
                    <tr> 
                      <td align="right" width="80" height="22" class="white">账&nbsp;&nbsp;号：</td>
                      <td width="10" height="22">&nbsp;</td>
                      <td width="160" height="22">
					    <input type="text" name="Nicknm" maxlength="16" value="<%=Nicknm%>" class="sig_t" tabindex="1">
                      </td>
                      <td width="70"> 
                        <input type="hidden" name="Call" value="1">
						<input type="submit" name="Submit" value="登陆" class="sig_b_index" tabindex="3">
                      </td>
                    </tr>
                    <tr> 
                      <td align="right" width="80" height="22" class="white">密&nbsp;&nbsp;码：</td>
                      <td width="10" height="22">&nbsp;</td>
                      <td width="160" height="22">
					    <input type="password" name="Passwd" maxlength="12" class="sig_t" tabindex="2">
                      </td>
                      <td width="70"> 
                        <input type="reset" name="Reset" value="重填" class="sig_b_index" tabindex="4">
                      </td>
                    </tr>
				   </form>
                    <tr> 
                      <td colspan="4" height="12">&nbsp;</td>
                    </tr>
                    <tr align="center"> 
                      <td colspan="4"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr align="center"> 
                            <td colspan="4" height="22">
                              <hr noshade width="100%" size="1" color="#ffffff">
                            </td>
                          </tr>
                          <tr align="center">
						    <td width="25%" height="22"><a href="outer/register.jsp">注册申请</a></td>
                            <td width="25%" height="22"><a href="outer/getpass.jsp">密码提示</a></td>
                            <td width="25%" height="22"><a href="outer/deluid.jsp">注销账号</a></td>
							<td width="25%" height="22"><a href="#">使用帮助</a></td>
						  </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="60">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td height="20">&nbsp;</td>
        </tr>
        <tr> 
          <td height="24">
		    <%@ include file = "./include/copyright.jsp" %>
          </td>
        </tr>
      </table>
	</td>
  </tr>
</table>

<%@ include file = "./include/footer.jsp" %>
