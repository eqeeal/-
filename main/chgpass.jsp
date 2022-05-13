<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%!
	String title	= "成绩管理注册表管理 - 修改密码";
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
          <td height="22" class="black">修改密码</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
            <table width="54%" border="0" cellspacing="1" cellpadding="1" bgcolor="<%=Bground%>">
			  <tr> 
                <td height="18" colspan="2"> 
                  <hr noshade width="100%" size="1" color="#000000">
                </td>
              </tr>
			  <form name="FormPWD" method="post" action="chgpwd.jsp" onSubmit="return checkPWD();">
              <tr bgcolor="<%=Bgworks%>"> 
                <td align="right" width="110" height="24" class="black">当前密码：</td>
                <td width="200" height="24"> 
                  <input type="password" name="nowpwd" maxlength="20" <%if(Integer.parseInt((String)session.getValue("Userid")) == 55555) {out.println("disabled");}%>>
                </td>
              </tr>
              <tr bgcolor="<%=Bgworks%>"> 
                <td align="right" width="110" height="24" class="black">输入新密码：</td>
                <td width="200" height="24"> 
                  <input type="password" name="newpwd" maxlength="20" <%if(Integer.parseInt((String)session.getValue("Userid")) == 55555) {out.println("disabled");}%>>
                </td>
              </tr>                    
              <tr bgcolor="<%=Bgworks%>"> 
                <td align="right" height="24" width="110" class="black">确认新密码：</td>
                <td height="24" width="200"> 
                  <input type="password" name="newpwd2" maxlength="20" <%if(Integer.parseInt((String)session.getValue("Userid")) == 55555) {out.println("disabled");}%>>
                </td>
              </tr>              
			  <tr> 
                <td height="18" colspan="2"> 
                  <hr noshade width="100%" size="1" color="#000000">
                </td>
              </tr>
			  <tr> 
                <td colspan="2" height="8"></td>
              </tr>
              <tr> 
                <td colspan="2" height="24" align="center"> 
                  <input type="submit" value="修改密码" class="sig_b_login"  style="width: 84px" <%if(Integer.parseInt((String)session.getValue("Userid")) == 55555) {out.println("disabled");}%>>
		          <input type="reset" value="重新填写" class="sig_b_login"  style="width: 84px" <%if(Integer.parseInt((String)session.getValue("Userid")) == 55555) {out.println("disabled");}%>>
                </td>
              </tr>
			  </form>
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
