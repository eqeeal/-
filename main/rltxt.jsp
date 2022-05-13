<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// 接收传递参数
	int tid = 0;
	String content = "", fName = "";
	tid = Integer.parseInt(request.getParameter("tid"));
	content	= new String((request.getParameter("content")).getBytes("8859_1"),"GBK");

	// 判断更新文件
	if(tid == 1) fName = "gzmyq.txt";
	if(tid == 2) fName = "gzmyh.txt";

	// 删除预写入文件
	fName = request.getRealPath("") + "\\txt\\" + fName;
	File f = new File(fName);
	if(f.exists()) f.delete();

	// 写入文件, 逐行写入
	FileWriter fw = new FileWriter(fName);
	StringTokenizer st = new StringTokenizer(content, "\r\n");
	int iNum = st.countTokens();
	for(int i=0; i<iNum; i++) {
		fw.write(st.nextToken());
		if(i!=iNum-1) fw.write("\r\n");
	}
	fw.close();
%>

<script language="javascript">
	alert("成功写入文本文件!");
	document.write("<meta http-equiv='refresh' content='0; url=wftxt.jsp?tid=<%=tid%>'>");
</script>
