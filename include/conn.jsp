<%
	// 连结处理
	String tid	= request.getParameter("tid");
	String area ="操作系统";

	if (tid.equalsIgnoreCase("2")) {
		// 说明
		jcon = JFactory.getJCon("gd");
		if(jcon == null) jcon = JFactory.getJCon("gd");
		
		db = jcon.getSQL();
		area = "离散数学";
	}
%>


<!--
<font size="2"><%=new String((new String("版权所有 深圳市振兴高科技术有限公司")).getBytes("8859_1"),"GBK")%></font> 
new String((new String("操作系统")).getBytes("8859_1"),"GBK");

new String((new String("离散数学")).getBytes("8859_1"),"GBK")
---->


<!--area	= new String((new String("操作系统")).getBytes("iso8859_1"),"GBK")
--->