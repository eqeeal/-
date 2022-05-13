function submit_login() {
	var login, passwd;
	var login	= FormLogin.Nicknm.value;
	var passwd	= FormLogin.Passwd.value;
	
	if((login=='') || (passwd=='')) {
		alert("必须输入管理员账号和管理员密码");
		return false;
	}		
}
	
function checkReg() {
	var Letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ_1234567890";
	for (i=0; i < formReg.nickname.value.length; i++) {
		var CheckChar = formReg.nickname.value.charAt(i);
		CheckChar = CheckChar.toUpperCase();
		if (Letters.indexOf(CheckChar) == -1) {
			alert ("管理员账号中有非法字符或空格!");
			return false;
		}
	}

	if(formReg.nickname.value.length==0 || formReg.passwd1.value.length==0 || formReg.passwd2.value.length==0 || formReg.question.value.length==0 || formReg.answer.value.length==0) {
		alert("缺少管理员信息!");
		return false;
	}

	if(formReg.passwd1.value.length < 6 || formReg.passwd2.value.length < 6) {
		alert("密码必须大于等于6位字符!");
		return false;
	}
				
	if(formReg.passwd1.value!=formReg.passwd2.value) {
		alert("确认密码与输入密码必须相符!");
		return false;
	}
}

function checkGet() {
	var nickname, question, answer;
	var nickname= FormGet.nickname.value;
	var question= FormGet.question.value;
	var answer	= FormGet.answer.value;
		
	if((nickname=='') || (question=='') || (answer=='')) {
		alert("请填写完整信息!");
		return false;
	}
}

function checkDel() {
	var nickname, passwd1, passwd2;
	var nickname= FormGet.nickname.value;
	var passwd1	= FormGet.passwd1.value;
	var passwd2	= FormGet.passwd2.value;
		
	if((nickname=='') || (passwd1=='') || (passwd2=='')) {
		alert("请填写完整信息!");
		return false;
	}
	else if(passwd1 != passwd2) {
		alert("请确认密码!");
		return false;
	}

	if (!confirm("确认注销管理员?")) {
		return false;
	}
}

function goto(url) {
	main.location=url;
}

function checkPWD() {
	var nowpwd, newpwd, newpwd2;
	var nowpwd	= FormPWD.nowpwd.value;
	var newpwd	= FormPWD.newpwd.value;
	var newpwd2	= FormPWD.newpwd2.value;
		
	if((nowpwd=='') || (newpwd=='') || (newpwd2=='')) {
		alert("请填写完整信息!");
		return false;
	}
	else if(newpwd != newpwd2) {
		alert("请确认新密码!");
		return false;
	}
}

function Jumping() {
	document.PageForm.submit();
	return;
}

function gotoPage(pagenum) {
	document.PageForm.jumpPage.value = pagenum;
	document.PageForm.submit();
	return;
}

function toSelectPrefix1(message) {
	if (message == "请选择：" || message == "程序异常，无法读取文件！" || message == "文件不存在，请检查！")
		document.myform1.prefixLen.value = 0;
	else 
		document.myform1.prefixLen.value = message.length;
	
	document.myform1.totalLen.value = eval(document.myform1.prefixLen.value*1) + eval(document.myform1.contentLen.value*1) + eval(document.myform1.posfixLen.value*1);
}

function toSelectPosfix1(message) {
	if (message == "请选择：" || message == "程序异常，无法读取文件！" || message == "文件不存在，请检查！")
		document.myform1.posfixLen.value = 0;
	else
		document.myform1.posfixLen.value = message.length;
	
	document.myform1.totalLen.value =  eval(document.myform1.prefixLen.value*1) + eval(document.myform1.contentLen.value*1) + eval(document.myform1.posfixLen.value*1);
}

function toInputContent1(message) {
	document.myform1.contentLen.value = message.length;
	document.myform1.totalLen.value = eval(document.myform1.prefixLen.value*1) + eval(document.myform1.contentLen.value*1) + eval(document.myform1.posfixLen.value*1);
}

function chkcsin() {
	if (document.myform1.usedate.value=="") {
		alert("对不起, 发送日期不能为空, 请输入!");
		document.myform1.usedate.focus();
		return false;
	}

	if (document.myform1.usedate.value!="") {
		if(chkdate(myform1.usedate.value) == 0) {
			alert("发送日期格式不正确!\n格式（yyyy-MM-dd）");
			myform1.usedate.value = "";
			myform1.usedate.focus();
			return false;
		}
	}

	if (document.myform1.content.value=="") {
		alert("对不起, 内容不能为空, 请输入!");
		document.myform1.content.focus();
		return false;
	}
	
	var len = eval(document.myform1.totalLen.value*1);
	if (len > 66) {
		alert("信息内容超长，请返回检查");
		document.myform1.content.focus();
		return false;
	}
	
	return true;
}

function toSelectPrefix2(message) {
	if (message == "请选择：" || message == "程序异常，无法读取文件！" || message == "文件不存在，请检查！")
		document.myform2.prefixLen.value = 0;
	else 
		document.myform2.prefixLen.value = message.length;
	
	document.myform2.totalLen.value = eval(document.myform2.prefixLen.value*1) + eval(document.myform2.contentLen.value*1) + eval(document.myform2.posfixLen.value*1);
}

function toSelectPosfix2(message) {
	if (message == "请选择：" || message == "程序异常，无法读取文件！" || message == "文件不存在，请检查！")
		document.myform2.posfixLen.value = 0;
	else
		document.myform2.posfixLen.value = message.length;
	
	document.myform2.totalLen.value =  eval(document.myform2.prefixLen.value*1) + eval(document.myform2.contentLen.value*1) + eval(document.myform2.posfixLen.value*1);
}

function toInputContent2(message) {
	document.myform2.contentLen.value = message.length;
	document.myform2.totalLen.value = eval(document.myform2.prefixLen.value*1) + eval(document.myform2.contentLen.value*1) + eval(document.myform2.posfixLen.value*1);
}

function chkzfin() {
	if (document.myform2.content.value=="") {
		alert("对不起, 内容不能为空, 请输入!");
		document.myform2.content.focus();
		return false;
	}
	
	var len = eval(document.myform2.totalLen.value*1);
	if (len > 70) {
		alert("信息内容超长，请返回检查");
		document.myform2.content.focus();
		return false;
	}
	
	return true;
}

function chkcsmdy() {
	if (document.myform3.content.value=="") {
		alert("对不起, 内容不能为空, 请输入!");
		document.myform3.content.focus();
		return false;
	}

	var len = document.myform3.content.length;
	if (len > 70) {
		alert("信息内容超长，请返回检查");
		document.myform3.content.focus();
		return false;
	}

	if (document.myform3.usedate.value=="") {
		alert("对不起, 发送日期不能为空, 请输入!");
		document.myform3.usedate.focus();
		return false;
	}

	if (document.myform3.usedate.value!="") {
		if(chkdate(myform3.usedate.value) == 0) {
			alert("发送日期格式不正确!\n格式（yyyy-MM-dd）");
			myform3.usedate.value = "";
			myform3.usedate.focus();
			return false;
		}
	}

	return true;
}

function chkqm() {
	if (document.fmobile.mobile.value!="") {
		var Letters = "1234567890";
		for(i=0; i < document.fmobile.mobile.value.length; i++) {
			var CheckChar = document.fmobile.mobile.value.charAt(i);
			CheckChar = CheckChar.toUpperCase();
			if(Letters.indexOf(CheckChar) == -1) {
				alert("只能输入数字!");
				document.fmobile.mobile.focus();
				return false;
			}
		}
		
		if(fmobile.mobile.value.length != 11) {
			alert("请输入正确的位数!");
			document.fmobile.mobile.focus();
			return false;
		}
	}

	return true;
}

// 函数名：chkdate 
// 返回值：0：不是日期 1：是日期 
function chkdate(datestr) {
	var lthdatestr;
	if(datestr != "") lthdatestr = datestr.length;
	else lthdatestr = 0;
	var tmpy="";
	var tmpm="";
	var tmpd="";

	var status;
	status = 0;
	if(lthdatestr== 0) return 0;
	for(i=0; i<lthdatestr; i++) {
		if(datestr.charAt(i)== '-') {
			status++;
		}
		if(status>2) {
			return 0;
		}
		if((status==0) && (datestr.charAt(i)!='-')) {
			tmpy = tmpy + datestr.charAt(i);
		}
		if((status==1) && (datestr.charAt(i)!='-')) {
			tmpm = tmpm + datestr.charAt(i);
		}
		if((status==2) && (datestr.charAt(i)!='-')) {
			tmpd = tmpd + datestr.charAt(i);
		}
	}
	
	year = new String(tmpy);
	month = new String(tmpm);
	day = new String(tmpd);
	
	if((tmpy.length!=4) || (tmpm.length>2) || (tmpd.length>2)) {
		return 0;
	}
	
	if(!((1<=month) && (12>=month) && (31>=day) && (1<=day))) {
		return 0;
	}
	
	if(!((year % 4)==0) && (month==2) && (day==29)) {
		return 0;
	}
	
	if((month<=7) && ((month % 2)==0) && (day>=31)) {
		return 0;
	}
	
	if((month>=8) && ((month % 2)==1) && (day>=31)) {
		return 0;
	}
	
	if((month==2) && (day==30)) {
		return 0;
	}
	
	return 1;
} 

