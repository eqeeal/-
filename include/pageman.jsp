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
