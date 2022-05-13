<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// 接收传递参数
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
   
	
	//new String((new String("操作系统")).getBytes("8859_1"),"GBK");

	// 判断发送时间是否更改


	if (!xgrq.equalsIgnoreCase(yyrq)) {
		// 删除原有顺序
		
		db.update(sql);

		// 取出序号
		int turn = 0;
		sql = "select count(*), max(seq) from gzmy_meili_info where datediff(year, usedate, '" + xgrq + "') = 0 and datediff(month, usedate, '" + xgrq + "') = 0 and datediff(day, usedate, '" + xgrq + "') = 0";

		rsCOM = db.select(sql);
		if(rsCOM==null || rsCOM.getRows()==0) turn = 1;
		else {
			if(Integer.parseInt(rsCOM.get(0, 0)) == 0) turn = 1;
			else turn = Integer.parseInt(rsCOM.get(0, 1)) + 1;
		}

		// 插入数据
		sql = "insert into gzmy_meili_info(seq,xuehao, content,name, usedate) values(" + turn + ", '" + xgnr + "','"+xgnr1+"','"+xgnr2+"', '" + xgrq + "')";

		if(db.update(sql)!=1) {	// 错误		
%>
			<script language="javascript">
				alert("数据操作出错!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
		else {
			// 找出刚刚新插入数据序号
			sql = "select top 1 msgid from gzmy_meili_info order by msgid desc";
			rsCOM = null;
			rsCOM = db.select(sql);
			id = rsCOM.get(0, 0);
%>
			<script language="javascript">
				alert("成功修改内容!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
	}
	else {
		sql = "update gzmy_meili_info set xuehao='" + xgnr + "', content = '" + xgnr1 + "',name = '" + xgnr2 + "', usedate = '" + xgrq + "' where msgid = " + id;
		//db.update(sql);
		if(db.update(sql)!=1) {	// 错误		
%>	
			<script language="javascript">
				alert("数据操作错!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
		else {
%>
			<script language="javascript">
				alert("成功修改内容!");
				document.write("<meta http-equiv='refresh' content='0; url=mody.jsp?tid=<%=tid%>&id=<%=id%>'>");
			</script>
<%
		}
	}
%>
