<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="incdb.jsp"%>
<%@ include file="sessionadmin.jsp"%>
<%try{
	String name = request.getParameter("name");
	int inout=Integer.parseInt(request.getParameter("inout"));
	
	
	PaytypeControl paytypecontrol= new PaytypeControl();
	paytypecontrol.setName(name);
	paytypecontrol.setInout(inout);
	paytypecontrol.addpaytype();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<meta HTTP-EQUIV=REFRESH CONTENT='4; URL=paytype_manage.jsp'>
<title>财务管理系统</title>
<link rel="stylesheet" href="images/css.css" type="text/css" media="screen">
</head>
<body topmargin=0>
<TABLE width=400 border="0" align=center cellpadding=4 cellspacing=1 class="tableBorder">
	<TR>
	  <Th align=center class="whitetitle"><strong>费用类型添加成功</strong></Th>
	</TR>
	<TR><TD align=center><BR>
	  本页面将在<b><span id=yu>3</span><a href=javascript:countDown></a></b>秒后自动返回费用类型管理页面，您可以选择以下操作：<BR>
	  <BR>
	<li><a href="main.jsp">返回首页</a><br>
	  <br>
	  </li>
	<li><a href='paytype_add.jsp'>继续添加费用类型</a><br>
	  <br>
	</li>
	<li><a href="paytype_manage.jsp">返回类型管理页面</a></li>
	</TD></TR>
</TABLE>

	<script>
	function 
	countDown(secs){yu.innerText=secs;if(--secs>0)setTimeout("countDown("+secs+")",1000);}countDown(3);
	</script>
	<%
	}
	catch(Exception e){
	out.println("错误信息:"+e.getMessage());
	}%>