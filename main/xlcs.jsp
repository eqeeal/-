<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	String title = "����֮��ע������ - ���ݹ���", csspath	= "../include";	
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
          <td height="22" class="black"><b><font color="red"><%=area%>[����֮��]</font></b>&nbsp;|&nbsp;���ݹ���&nbsp;&nbsp;<a href="javascript:if(confirm('����ϸ��飬ȷ��ɾ������¼����Ϣ��?')) window.location='delete.jsp?tid=<%=tid%>&type=all&id=0'" class="black">ɾ������</a>&nbsp;&nbsp;<a href="manacon.jsp?tid=2">��������</a></td>
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
							  <td height="22" width="8%" class="black">���ݱ��</td>
							  <td height="22" width="68%" class="black">��Ϣ����</td>	
							  <td height="22" width="12%" class="black">����ʱ��</td>	
							  <td height="22" width="6%" class="black">�޸�</td>
							  <td height="22" width="6%" class="black">ɾ��</td>
							</tr>
<%
	// �������ڴ���
	String fsrq = request.getParameter("fsrq");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	cal.setTime(new java.util.Date());

	if(fsrq != null && !fsrq.equals("null"))
		fsrq = request.getParameter("fsrq");
	else
		fsrq = df.format(cal.getTime());

	// ��ҳ��ʾ��¼
	iPageLenI = 5;

	int num = 0;
	int curPage	= 1;
	int maxPage, maxRowCount;		

	// ��ǰҳ��
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

			out.println("<td align=\"center\"><a href=\"mody.jsp?tid=" + tid + "&id=" + rsCOM.get(i, 3) + "\">�޸�</a></td>");
			out.println("<td align=\"center\"><a href=\"javascript:if(confirm('ȷ��ɾ����?')) window.location='delete.jsp?tid=" + tid + "&type=single&id=" + rsCOM.get(i, 3) + "'\">ɾ��</a></td>");
			// out.println("<td align=\"center\">ɾ��</td>");
			out.println("</tr>");
		}
	}
	
	if(maxPage > 1) {
%>
								  <tr height="20">
									<td colspan="5" class="black">
									  <form name="PageForm" action="manacon.jsp?tid=<%=tid%>"  method="post">
										<%//@ include file="../include/pageman.jsp"%>
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

	// ����¼��
%>
								  <tr>
								    <td colspan="5" height="12"></td>
								  </tr>
								  <tr bgcolor="<%=Bgtitle%>" height="22">
								    <td colspan="5" class="white">&nbsp;&gt;&nbsp;���ɼ�����&nbsp;-&nbsp;��Ϣ¼��</td>
								  </tr>
								  <tr>
								    <td colspan="5"><hr noshade width="100%" size="1" color="#000000"></td>
								  </tr>
								  <form name="myform1" action="input.jsp" method="post" onsubmit="javascript:return chkcsin();">
								  <tr height="22">
									<td colspan="3" class="black">
									  ǰ׺��<select name="prefix" onchange="toSelectPrefix1(this.options[selectedIndex].text)">
									    <option value="��ѡ��">��ѡ��</option>
<%
	// ��ȡ��Ф����ǰ׺
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
									  ����ʱ�䣺<input type="text" name="usedate" value="<%=fsrq%>" size="16">
									</td>
									<td colspan="2" class="black">
									  ������<input type="text" name="prefixLen" value="0" size="2" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="3" class="black">
									  ���ݣ�<textarea name="content" rows="4" cols="72" onchange="toInputContent1(this.value)"></textarea>
									</td>
									<td colspan="2" class="black">
									  ������<input type="text" name="contentLen" size="3" value="0" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="3" class="black">
									  ��׺��<select name="posfix" onchange="toSelectPosfix1(this.options[selectedIndex].text)">
									    <option value="��ѡ��">��ѡ��</option>
<%
	// ��ȡ��Ф�����׺
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
									  ������<input type="text" name="posfixLen" value="0" size="2" disabled>
									</td>
								  </tr>
								  <tr height="22">
								    <td colspan="3">
									  <input type="hidden" name="tid" value="<%=tid%>">
									  <input type="submit" name="csin" value="����¼��" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="������д" class="sig_b_login">
									</td>
									<td colspan="2" class="black">
									  �ܹ���<input type="text" name="totalLen" value="0" size="3" disabled>
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
