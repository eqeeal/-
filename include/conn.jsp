<%
	// ���ᴦ��
	String tid	= request.getParameter("tid");
	String area ="����ϵͳ";

	if (tid.equalsIgnoreCase("2")) {
		// ˵��
		jcon = JFactory.getJCon("gd");
		if(jcon == null) jcon = JFactory.getJCon("gd");
		
		db = jcon.getSQL();
		area = "��ɢ��ѧ";
	}
%>


<!--
<font size="2"><%=new String((new String("��Ȩ���� ���������˸߿Ƽ������޹�˾")).getBytes("8859_1"),"GBK")%></font> 
new String((new String("����ϵͳ")).getBytes("8859_1"),"GBK");

new String((new String("��ɢ��ѧ")).getBytes("8859_1"),"GBK")
---->


<!--area	= new String((new String("����ϵͳ")).getBytes("iso8859_1"),"GBK")
--->