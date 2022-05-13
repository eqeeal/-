<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%!
	String title	= "成绩管理注册表管理 - 管理目录";
	String csspath	= "../include";
%>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/const.jsp" %>

<script language="javascript" src="../include/zb.js"></script>
<script language="javascript" src="../include/button.js"></script>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="<%=Bground%>" align="center">
  <tr>
    <td height="30"> 
      <table border="0" cellspacing="0" cellpadding="0" height="18">
        <tr>
		  <td width="10"></td>
<%
	if(Signid.indexOf("1") != -1 || Signid.indexOf("44444444") != -1) {
%>
		  <td width="72" class="coolButton" OnClick="goto('manacon.jsp?tid=1');" align="center"> 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)">
              <tr> 
                <td class="black">操作系统</td>
              </tr>
            </table>
          </td>
<%
	}
%>
<%
	if(Signid.indexOf("2") != -1 || Signid.indexOf("44444444") != -1) {
%>
		  <td width="72" class="coolButton" OnClick="goto('manacon.jsp?tid=2');" align="center"> 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)">
              <tr> 
                <td class="black">离散数学</td>
              </tr>
            </table>
          </td>
<%
	}
%>
          <td width="20"></td>

<%
	if(Signid.indexOf("44444444") != -1) {
%>		  
		  <td width="60" class="coolButton" OnClick="goto('popedom.jsp');" align="center"> 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)">
              <tr> 
                <td class="black">权限管理</td>
              </tr>
            </table>
          </td>
		  <td width="60" class="coolButton" OnClick="goto('wftxt.jsp');" align="center"> 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)">
              <tr> 
                <td class="black">资料维护</td>
              </tr>
            </table>
          </td>
<%
	}
%>
		  <td width="60" class="coolButton" OnClick="goto('chgpass.jsp');" align="center"> 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)">
              <tr> 
                <td class="black">修改密码</td>
              </tr>
            </table>
          </td>
          <td width="60" class="coolButton" align="center" > 
            <table align="center" style="filter: DropShadow(Color=#ffffff, OffX=-1, OffY=-1, Positive=1)" OnClick="if(confirm('确认退出吗?')) window.main.location='logout.jsp';">
              <tr> 
                <td class="black">退出系统</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td height="30">
	  <%@ include file = "../include/copyright.jsp" %>
	</td>
  </tr>
<%
	String tid = "1";
	if(Signid.indexOf("44444444") != -1)
		tid = "1";
	else
		tid = Signid;
%>
  <tr> 
    <td colspan="3" width="100%" height="100%" align="center">
	  <iframe frameBorder="0" id="main" name="main" scrolling="no" src="manacon.jsp?tid=<%=tid%>" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"></iframe>
	</td>
  </tr>
</table>

<%@ include file = "../include/footer.jsp" %>
