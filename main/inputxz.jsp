<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>
<%@ page import = "java.util.*" %>

<%
	// 接收参数
	String csnr = "";
	csnr	= new String((request.getParameter("content")).getBytes("8859_1"),"GBK");

	// 分析采集数据
	String tmp[] = null;
	StringTokenizer stringtokenizer = new StringTokenizer(csnr, "\n");
	int count = stringtokenizer.countTokens();
	if(count > 0) {
		tmp = new String[count];
		for(int i=0; i<count && stringtokenizer.hasMoreTokens(); i++) {
			String next = stringtokenizer.nextToken();
			if(!"null".equals(next)) {
				tmp[i] = next.trim();
				if(tmp[i].length()>70) {
%>
					<script language="javascript">
						alert("数据采集出错!\n请确认每条信息字数不超过70字!");
						document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
					</script>
<%
					return;
				}
			}
		}
	}

	if(count!=12) {
		// 录入出错
%>
		<script language="javascript">
			alert("数据采集出错!\n请确认为12个星座数据且每条信息字数不超过70字!");
			document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
		</script>
<%
		return;
	}

	for(int i=0; i<tmp.length; i++) {
		sql = "insert into JM_XZ_INDEX(Xz_index_bh, Xz_index_type, Xz_index_cont) values(" + (i+1) + ", 'YC', '" + tmp[i] + "')";

		if(db.update(sql)==-1) {	// 错误
%>
			<script language="javascript">
				alert("数据操作出错!");
				document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
			</script>
<%
			return;
		}	
	}
%>
	<script language="javascript">
		alert("成功发布采集信息!");
		document.write("<meta http-equiv='refresh' content='0; url=xzyc.jsp?tid=<%=tid%>'>");
	</script>
