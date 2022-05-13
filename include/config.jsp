
<%@ page import = "java.io.*, java.sql.*, java.util.*, java.text.*" %>
<%@ page import = "com.fei.db.*" %>
<%@ page session="true" %>

<%
	int intID = 0;
	String Userid = "";	// 字符型用户ID
	String Nicknm = "";
	String Passwd = "";
	String Signid = "";	// 管理员权限

	// 超级管理员账号密码
	String adminUid = "admin";
	String adminPwd = "8188";
	
	// 数据库连结对象
	JConnect jcon = JFactory.getJCon("jm");
	if(jcon == null) jcon = JFactory.getJCon("jm");
	
	SQL db = jcon.getSQL();

	JResult rsCOM = null;
	JResult rsCHK = null;
	String sql = "";
	
	// 保存传递参数
	Enumeration enum = request.getParameterNames();
	Hashtable hashReq= new Hashtable();
	while(enum.hasMoreElements()) {
		Object strKey=enum.nextElement();
		hashReq.put(strKey, request.getParameter(strKey.toString()));
	}
	
	// 用户验证
	if(hashReq.containsKey("Call") && hashReq.containsKey("Nicknm")) {	//Call表示登陆
		Nicknm = request.getParameter("Nicknm");
		Passwd = request.getParameter("Passwd");

		// 首先判断是否超级管理员
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

			if(rsCHK==null || rsCHK.getRows()==0) {	// 没有这个用户
				String tip = new String((new String("用户名或密码错，请重新登录!")).getBytes("8859_1"),"GBK");
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
				String tip = new String((new String("对不起, 您还没有被分配管理模块!请联系超级管理员!")).getBytes("8859_1"),"GBK");
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
	else {	// 来自网页调用的页面传递
		if(hashReq.containsKey("Write")){}	// 新注册
		else if(hashReq.containsKey("Getpwd")){}	// 取密码
		else if(hashReq.containsKey("Logout")){}	// 注销
		else {
			Userid = "" + session.getValue("Userid");
			intID = Integer.parseInt(Userid.equals("")||Userid.equals("null")?"0":Userid);
			Nicknm = new String("" + session.getValue("Nicknm"));
			Passwd = new String("" + session.getValue("Passwd"));
			Signid = new String("" + session.getValue("Signid"));
			if(intID==0) {	// session值过期
				String tip = new String((new String("连接超时，请重新登录!")).getBytes("8859_1"),"GBK");
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
