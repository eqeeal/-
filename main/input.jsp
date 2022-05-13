<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file = "../include/config.jsp" %>
<%@ include file = "../include/conn.jsp" %>

<%
	// 接收参数
	String csnr = "", prefix = "", posfix = "", issue = "",csnr2="",csnr3="";
	prefix	= new String((request.getParameter("prefix")).getBytes("8859_1"),"GBK");
	posfix	= new String((request.getParameter("posfix")).getBytes("8859_1"),"GBK");
	csnr	= new String((request.getParameter("content")).getBytes("8859_1"),"GBK");
	csnr2	= new String((request.getParameter("content1")).getBytes("8859_1"),"GBK");
	csnr3	= new String((request.getParameter("xuehao")).getBytes("8859_1"),"GBK");
	issue	= new String((request.getParameter("usedate")).getBytes("8859_1"),"GBK");

	if(!prefix.equalsIgnoreCase("请选择：")) csnr = prefix + csnr;
	if(!posfix.equalsIgnoreCase("请选择：")) csnr = csnr + posfix;

	// 取出序号
	int turn = 0;
	sql = "select count(*), max(seq) from gzmy_meili_info where datediff(year, usedate, '" + issue + "') = 0 and datediff(month, usedate, '" + issue + "') = 0 and datediff(day, usedate, '" + issue + "') = 0";

	rsCOM = db.select(sql);
	if(rsCOM==null || rsCOM.getRows()==0) turn = 1;
	else {
		if(Integer.parseInt(rsCOM.get(0, 0)) == 0) turn = 1;
		else turn = Integer.parseInt(rsCOM.get(0, 1)) + 1;
	}

	// 插入数据
	sql = "insert into gzmy_meili_info(seq,xuehao, content,name, usedate) values(" + turn + ", '" + csnr3 + "', '" + csnr + "','"+csnr2+"', '" + issue + "')";
	
	if(db.update(sql)!=1) {	// 错误
%>
		<script language="javascript">
			alert("数据操作出错!");
			document.write("<meta http-equiv='refresh' content='0; url=manacon.jsp?tid=<%=tid%>&fsrq=<%=issue%>'>");
		</script>
<%
	}
	else {
%>
		<script language="javascript">
			alert("成功发布采集信息!");
			document.write("<meta http-equiv='refresh' content='0; url=manacon.jsp?tid=<%=tid%>&fsrq=<%=issue%>'>");
		</script>
<%
	}
%>
