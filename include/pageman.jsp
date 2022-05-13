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
