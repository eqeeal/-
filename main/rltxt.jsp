<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>

<%
	// ���մ��ݲ���
	int tid = 0;
	String content = "", fName = "";
	tid = Integer.parseInt(request.getParameter("tid"));
	content	= new String((request.getParameter("content")).getBytes("8859_1"),"GBK");

	// �жϸ����ļ�
	if(tid == 1) fName = "gzmyq.txt";
	if(tid == 2) fName = "gzmyh.txt";

	// ɾ��Ԥд���ļ�
	fName = request.getRealPath("") + "\\txt\\" + fName;
	File f = new File(fName);
	if(f.exists()) f.delete();

	// д���ļ�, ����д��
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
	alert("�ɹ�д���ı��ļ�!");
	document.write("<meta http-equiv='refresh' content='0; url=wftxt.jsp?tid=<%=tid%>'>");
</script>
