
<%@ page import = "java.io.*, java.sql.*, java.util.*, java.text.*" %>
<%@ page import = "com.fei.db.*" %>
<%@ page session="true" %>

<%
	int intID = 0;
	String Userid = "";	// �ַ����û�ID
	String Nicknm = "";
	String Passwd = "";
	String Signid = "";	// ����ԱȨ��

	// ��������Ա�˺�����
	String adminUid = "admin";
	String adminPwd = "8188";
	
	// ���ݿ��������
	JConnect jcon = JFactory.getJCon("jm");
	if(jcon == null) jcon = JFactory.getJCon("jm");
	
	SQL db = jcon.getSQL();

	JResult rsCOM = null;
	JResult rsCHK = null;
	String sql = "";
	
	// ���洫�ݲ���
	Enumeration enum = request.getParameterNames();
	Hashtable hashReq= new Hashtable();
	while(enum.hasMoreElements()) {
		Object strKey=enum.nextElement();
		hashReq.put(strKey, request.getParameter(strKey.toString()));
	}
	
	// �û���֤
	if(hashReq.containsKey("Call") && hashReq.containsKey("Nicknm")) {	//Call��ʾ��½
		Nicknm = request.getParameter("Nicknm");
		Passwd = request.getParameter("Passwd");

		// �����ж��Ƿ񳬼�����Ա
		if(Nicknm.equalsIgnoreCase(adminUid) && Passwd.equalsIgnoreCase(adminPwd)) {
			Userid = "55555";
			Nicknm = adminUid;
			Passwd = adminPwd;
			Signid = "44444444";
			
			session.putValue("Userid", "55555");
			session.putValue("Nicknm", adminUid);
			session.putValue("Passwd", adminPwd);
			session.putValue("Signid", "44444444");
		}
		else {
			sql = "select Manage_user_id, Manage_user_nick, Manage_user_pwd, Manage_user_sign from gzmy_manage_user where Manage_user_nick = '" + Nicknm + "' and Manage_user_pwd = '" + Passwd + "'";
			rsCHK = db.select(sql);

			if(rsCHK==null || rsCHK.getRows()==0) {	// û������û�
				String tip = new String((new String("�û���������������µ�¼!")).getBytes("8859_1"),"GBK");
%>

				<script language="javascript">
					alert("<%=tip%>");
					window.location = "../";
				</script>

<%
				return;
			}

			Userid = rsCHK.get(0, 0);
			Nicknm = rsCHK.get(0, 1);
			Passwd = rsCHK.get(0, 2);
			Signid = rsCHK.get(0, 3);
			
			if(Signid.equalsIgnoreCase("0")) {
				String tip = new String((new String("�Բ���, ����û�б��������ģ��!����ϵ��������Ա!")).getBytes("8859_1"),"GBK");
%>

				<script language="javascript">
					alert("<%=tip%>");
					window.location = "../";
				</script>

<%
				return;
			}

			session.putValue("Userid", Userid);
			session.putValue("Nicknm", Nicknm);
			session.putValue("Passwd", Passwd);
			session.putValue("Signid", Signid);
		}
	}
	else {	// ������ҳ���õ�ҳ�洫��
		if(hashReq.containsKey("Write")){}	// ��ע��
		else if(hashReq.containsKey("Getpwd")){}	// ȡ����
		else if(hashReq.containsKey("Logout")){}	// ע��
		else {
			Userid = "" + session.getValue("Userid");
			intID = Integer.parseInt(Userid.equals("")||Userid.equals("null")?"0":Userid);
			Nicknm = new String("" + session.getValue("Nicknm"));
			Passwd = new String("" + session.getValue("Passwd"));
			Signid = new String("" + session.getValue("Signid"));
			if(intID==0) {	// sessionֵ����
				String tip = new String((new String("���ӳ�ʱ�������µ�¼!")).getBytes("8859_1"),"GBK");
%>

				<script language="javascript">
					alert("<%=tip%>");
					window.parent.location = "../";
				</script>

<%
				return;
			}
		}
	}
%>
