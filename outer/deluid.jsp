<%@ page contentType="text/html;charset=gb2312" %>
<%!
	String title	= "�ɼ�����ע������ - ע���˺�";
	String csspath	= "../include";
%>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/const.jsp" %>

<script language="javascript" src="../include/zb.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" height="232" bgcolor="<%=Bground%>">
        <tr> 
          <td height="24">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="<%=Bgtitle%>"> 
                <td rowspan="2" width="60">&nbsp;</td>
                <td height="24" class="white"><b>ϵͳ���� - <font color="<%=Bgindex%>">ע���˺�</font></b></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td height="20">&nbsp; </td>
        </tr>
        <tr> 
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" height="194">
              <tr> 
                <td width="60">&nbsp;</td>
                <td bgcolor="<%=Bgindex%>"> 
                  <table width="320" border="0" cellspacing="0" cellpadding="0" align="center" height="140">
                    <tr> 
                      <td align="right" height="20" width="110"><b>&gt;&gt;</b>&nbsp;<a href="../">������ҳ</a>&nbsp;&nbsp;</td>
                      <td colspan="2" height="20">&nbsp;</td>
                    </tr>
                    <form name="FormGet" method="post" action="delmsg.jsp" onSubmit="return checkDel();">
                    <tr> 
                      <td align="right" width="110" height="24" class="white">����Ա�˺ţ�</td>
                      <td width="10" height="24">&nbsp;</td>
                      <td width="200" height="24"> 
                          <input type="text" name="nickname" class="sig_t" maxlength="20">
                      </td>
                    </tr>
                    <tr> 
                      <td align="right" width="110" height="24" class="white">����Ա���룺</td>
                      <td width="10" height="24">&nbsp;</td>
                      <td width="200" height="24"> 
                          <input type="password" name="passwd1" class="sig_t" maxlength="20">
                      </td>
                    </tr>                    
                    <tr> 
                      <td align="right" height="24" width="110" class="white">ȷ�����룺</td>
                      <td width="10" height="24">&nbsp;</td>
                      <td height="24" width="200"> 
                          <input type="password" name="passwd2" class="sig_t" maxlength="20">
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24"> 
                        <hr noshade width="100%" size="1" color="#ffffff">
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="24" align="center"> 
                        <input type="submit" name="Logout" value="ע��" class="sig_b_index">
                        <input type="reset" name="Reset" value="����" class="sig_b_index">
                      </td>
                    </tr>
					</form>
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
          <td height="24" class="black">
            <%@ include file = "../include/copyright.jsp" %>
          </td>
        </tr>
      </table>
    
<%@ include file = "../include/footer.jsp" %>
