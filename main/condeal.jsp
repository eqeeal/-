								  <tr align="center" bgcolor="#ffffff">
									<td height="22" width="10%" class="black">���ݱ��</td>
									<td height="22" width="78%" class="black">��Ϣ����</td>	
									<td height="22" width="6%" class="black">�޸�</td>
									<td height="22" width="6%" class="black">ɾ��</td>
								  </tr>
<%
	// ��ҳ��ʾ��¼
	iPageLenI = 5;

	int num = 0;
	int curPage	= 1;
	int maxPage, maxRowCount;		

	// ��ǰҳ��
	String jumpPage = request.getParameter("jumpPage");
	if(jumpPage != null && !jumpPage.equals("null")) curPage = Integer.parseInt(jumpPage);
		
	sql	= "select seq, content from gzmy_meili_info order by seq desc";
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
			out.println("<td align=\"center\"><a href=\"mody.jsp?id=" + rsCOM.get(i, 0) + "\">�޸�</a></td>");
			// out.println("<td align=\"center\"><a href=\"javascript:if(confirm('ȷ��ɾ����?')) window.location='delete.jsp?type=single&id=" + rsCOM.get(i, 0) + "'\">ɾ��</a></td>");
			out.println("<td align=\"center\">ɾ��</td>");
			out.println("</tr>");
		}
	}
	
	if(maxPage > 1) {
%>
								  <tr height="20">
									<td colspan="4" class="black">
									  <form name="PageForm" action="manacon.jsp"  method="post">
										<%@ include file="../include/pageman.jsp"%>
									  </form>
									</td>
								  </tr>
<%
	}

	// ����¼��
%>
								  <tr>
								    <td colspan="4" height="12"></td>
								  </tr>
								  <tr bgcolor="<%=Bgtitle%>" height="22">
								    <td colspan="4" class="white">&nbsp;&gt;&nbsp;���������ѡ�&nbsp;-&nbsp;��Ϣ¼��</td>
								  </tr>
								  <tr>
								    <td colspan="4"><hr noshade width="100%" size="1" color="#000000"></td>
								  </tr>
								  <form name="myform1" action="input.jsp" method="post" onsubmit="javascript:return chkcsin();">
								  <tr height="22">
									<td colspan="2" class="black">
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
									</td>
									<td colspan="2" class="black">
									  ������<input type="text" name="prefixLen" value="0" size="2" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="2" class="black">
									  ���ݣ�<textarea name="content" rows="4" cols="72" onchange="toInputContent1(this.value)"></textarea>
									</td>
									<td colspan="2" class="black">
									  ������<input type="text" name="contentLen" size="3" value="0" disabled>
									</td>
								  </tr>
								  <tr height="22">
									<td colspan="2" class="black">
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
								    <td colspan="2">
									  <input type="submit" name="csin" value="����¼��" class="sig_b_login">&nbsp;&nbsp;<input type="reset" name="Reset" value="������д" class="sig_b_login">
									</td>
									<td colspan="2" class="black">
									  �ܹ���<input type="text" name="totalLen" value="0" size="3" disabled>
									</td>
								  </tr>
								  </form>
