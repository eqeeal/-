<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	String title = "命运之轮注册表管理 - 内容管理", csspath	= "../include";	
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
          <td height="22" class="black"><b><font color="red"><%=area%>[命运之轮]</font></b>&nbsp;|&nbsp;内容管理&nbsp;&nbsp;<a href="javascript:if(confirm('请仔细检查，确认删除所有录入信息吗?')) window.location='delete.jsp?tid=<%=tid%>&type=all&id=0'" class="black">删除所有</a>&nbsp;&nbsp;<a href="manacon.jsp?tid=2">闺中密友</a></td>
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
					  <tr>
						<td width="100%" valign="top">
						  <table width="100%" border="0" cellspacing="1" cellpadding="1">
							<%//@ include file = "condeal.jsp" %>
							<tr align="center" bgcolor="#ffffff">
							  <td height="22" width="8%" class="black">内容编号</td>
							  <td height="22" width="68%" class="black">信息内容</td>	
							  <td height="22" width="12%" class="black">发送时间</td>	
							  <td height="22" width="6%" class="black">修改</td>
							  <td height="22" width="6%" class="black">删除</td>
							</tr>
<%
	// 发送日期处理
	String fsrq = request.getParameter("fsrq");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	cal.setTime(new java.util.Date());

	if(fsrq != null && !fsrq.equals("null"))
		fsrq = request.getParameter("fsrq");
	else
		fsrq = df.format(cal.getTime());

	// 分页显示记录
	iPageLenI = 5;

	int num = 0;
	int curPage	= 1;
	int maxPage, maxRowCount;		

	// 当前页面
	String jumpPage = request.getParameter("jumpPage");
	if(jumpPage != null && !jumpPage.equals("null")) curPage = Integer.parseInt(jumpPage);
		
	sql	= "select seq, content, usedate, msgid from gzmy_meili_info order by usedate desc, seq desc";
	rsCOM = db.select(sql, curPage - 1, iPageLenI);

	maxRowCount = rsCOM.getTotal();
	if(maxRowCount % iPageLenI == 0)
		maxPage = maxRowCount / iPageLenI;
	else
		maxPage = maxRowCount / iPageLenI + 1;
	num = rsCOM.getRows();

	if(rsCOM.getRows()!=0) {
		for(int i=0; i<num; i++) {
			out.println("<tr height=\"22\" bgcolor=\"" + Bgworks + "\">");
			out.println("<td align=\"center\">" + rsCOM.get(i, 0) + "</td>");
			out.println("<td>" + rsCOM.get(i, 1) + "</td>");

			if (rsCOM.get(i, 2) != null && !rsCOM.get(i, 2).equals("null") && !rsCOM.get(i, 2).equals(""))
				out.println("<td align=\"center\">" + rsCOM.get(i, 2).substring(0, 10) + "</td>");
			else
				out.println("<td>&nbsp;</td>");

			out.println("<td align=\"center\"><a href=\"mody.jsp?tid=" + tid + "&id=" + rsCOM.get(i, 3) + "\">修改</a></td>");
			out.println("<td align=\"center\"><a href=\"javascript:if(confirm('确认删除吗?')) window.location='delete.jsp?tid=" + tid + "&type=single&id=" + rsCOM.get(i, 3) + "'\">删除</a></td>");
			// out.println("<td align=\"center\">删除</td>");
			out.println("</tr>");
		}
	}
	
	if(maxPage > 1) {
%>
								  <tr height="20">
									<td colspan="5" class="black">
									  <form name="PageForm" action="manacon.jsp?tid=<%=tid%>"  method="post">
										<%//@ include file="../include/pageman.jsp"%>
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

	// 数据录入
%>
								  <tr>
								    <td colspan="5" height="12"></td>
								  </tr>
								  <tr bgcolor="<%=Bgtitle%>" height="22">
								    <td colspan="5" class="white">&nbsp;&gt;&nbsp;『成绩管理』&nbsp;-&nbsp;信息录入</td>
								  </tr>
								  <tr>
								    <td colspan="5"><hr noshade width="100%" size="1" color="#000000"></td>
								  </tr>
								  <form name="myform1" action="input.jsp" method="post" onsubmit="javascript:return chkcsin();">
								  <tr height="22">
									<td colspan="3" class="black">
									  前缀：<select name="prefix" onchange="toSelectPrefix1(this.options[selectedIndex].text)">
									    <option value="请选择：">请选择：</option>
<%
	// 读取生肖测算前缀
	String fName = "";
	fName = request.getRealPath("") + "\\txt\\gzmyq.txt";
	FileReader fr1 = new FileReader(fName);
	BufferedReader br1 = new BufferedReader(fr1);
	String Line1 = br1.readLine();
	while(Line1 != null) {
		out.println("<option value=\"" + Line1 + "\">" + Line1 + "</option>");
		Line1 = br1.readLine();
	}
	br1.close();
	fr1.close();
%>
									  </select>
									  发送时间：<input type="text" name="usedate" value="<%=fsrq%>" size="16">
									</td>
									<td colspan="2" class="black">
									  字数：<input type="text" name="prefixLen" value="0" size="2" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="3" class="black">
									  内容：<textarea name="content" rows="4" cols="72" onchange="toInputContent1(this.value)"></textarea>
									</td>
									<td colspan="2" class="black">
									  字数：<input type="text" name="contentLen" size="3" value="0" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="3" class="black">
									  后缀：<select name="posfix" onchange="toSelectPosfix1(this.options[selectedIndex].text)">
									    <option value="请选择：">请选择：</option>
<%
	// 读取生肖测算后缀
	fName = request.getRealPath("") + "\\txt\\gzmyh.txt";
	FileReader fr2 = new FileReader(fName);
	BufferedReader br2 = new BufferedReader(fr2);
	String Line2 = br2.readLine();
	while(Line2 != null) {
		out.println("<option value=\"" + Line2 + "\">" + Line2 + "</option>");
		Line2 = br2.readLine();
	}
	br2.close();
	fr2.close();
%>
									  </select>
									</td>
									<td colspan="2" class="black">
									  字数：<input type="text" name="posfixLen" value="0" size="2" disabled>
									</td>
								  </tr>
								  <tr height="22">
								    <td colspan="3">
									  <input type="hidden" name="tid" value="<%=tid%>">
									  <input type="submit" name="csin" value="保存录入" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="重新填写" class="sig_b_login">
									</td>
									<td colspan="2" class="black">
									  总共：<input type="text" name="totalLen" value="0" size="3" disabled>
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
