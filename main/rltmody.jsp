<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// ���մ��ݲ���
	String id = "";
	id	= request.getParameter("id");

	String xgnr = "",xgnr1 = "",xgnr2 = "", xgrq = "", yyrq = "";
 //request.setCharacterEncoding("GBK");
//xgnr =(String)request.getParameter("xuehao");
//xgnr1=(String) request.getParameter("content");
//xgnr2=(String) request.getParameter("content1");
//xgrq =(String) request.getParameter("usedate");
//yyrq = (String)request.getParameter("olduse");

	xgnr = new String((request.getParameter("xuehao")).getBytes("8859_1"),"GBK");
  xgnr1 = new String((request.getParameter("content")).getBytes("8859_1"),"GBK");
 xgnr2= new String((request.getParameter("content1")).getBytes("8859_1"),"GBK");
xgrq = new String((request.getParameter("usedate")).getBytes("8859_1"),"GBK");
yyrq = new String((request.getParameter("olduse")).getBytes("8859_1"),"GBK");
   
	
	//new String((new String("����ϵͳ")).getBytes("8859_1"),"GBK");

	// �жϷ���ʱ���Ƿ����


	if (!xgrq.equalsIgnoreCase(yyrq)) {
		// ɾ��ԭ��˳��
		
		db.update(sql);

		// ȡ�����
		int turn = 0;
		sql = "select count(*), max(seq) from gzmy_meili_info where datediff(year, usedate, '" + xgrq + "') = 0 and datediff(month, usedate, '" + xgrq + "') = 0 and datediff(day, usedate, '" + xgrq + "') = 0";

		rsCOM = db.select(sql);
		if(rsCOM==null || rsCOM.getRows()==0) turn = 1;
		else {
			if(Integer.parseInt(rsCOM.get(0, 0)) == 0) turn = 1;
			else turn = Integer.parseInt(rsCOM.get(0, 1)) + 1;
		}

		// ��������
		sql = "insert into gzmy_meili_info(seq,xuehao, content,name, usedate) values(" + turn + ", '" + xgnr + "','"+xgnr1+"','"+xgnr2+"', '" + xgrq + "')";

		if(db.update(sql)!=1) {	// ����		
%>
			<script language="javascript">
				alert("���ݲ�������!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
		else {
			// �ҳ��ո��²����������
			sql = "select top 1 msgid from gzmy_meili_info order by msgid desc";
			rsCOM = null;
			rsCOM = db.select(sql);
			id = rsCOM.get(0, 0);
%>
			<script language="javascript">
				alert("�ɹ��޸�����!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
	}
	else {
		sql = "update gzmy_meili_info set xuehao='" + xgnr + "', content = '" + xgnr1 + "',name = '" + xgnr2 + "', usedate = '" + xgrq + "' where msgid = " + id;
		//db.update(sql);
		if(db.update(sql)!=1) {	// ����		
%>	
			<script language="javascript">
				alert("���ݲ�����!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
		else {
%>
			<script language="javascript">
				alert("�ɹ��޸�����!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
	}
%>
