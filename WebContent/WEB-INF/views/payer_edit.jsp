<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="incdb.jsp"%>
<%@ include file="sessionadmin.jsp"%>
<%int id =(null==request.getParameter("id")?1:(Integer.parseInt(request.getParameter("id"))));
		DispPayer disppayer = new DispPayer();
		disppayer.setId(id);
		Payer payer = disppayer.idToPayer();	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>财务管理系统</title>
<link rel="stylesheet" href="images/css.css" type="text/css" media="screen">
<script Language="JavaScript">
<!--
function check_input(theForm)
{

   if (theForm.name.value == "")
  {
    alert("请输入报销人.");
    theForm.name.focus();
    return (false);
  }

  if (theForm.name.value.length > 20)
    {
    alert("报销人姓名长度应小于10个字符或数字.");
    theForm.name.focus();
    return (false);
  }

}
//-->
</script>
</head>
<body topmargin=0>
<TABLE width=50% border="0" align=center cellpadding=4 cellspacing=1 class="tableBorder">
<form method="POST" action="payer_editsave.jsp?id=<%=id%>" onsubmit="return check_input(this)">
	<TR height=25>
		<Th colspan=2><div align="center" class="whitetitle"><B>编辑报销人</B></div></Th>
	</TR>
	<TR bgcolor="#FFFFFF"><TD width="30%">&nbsp;<B>部门名称</B></TD>
		<TD width="70%">
	  <input TYPE="text" name=name size=20 maxlength=20 value=<%=payer.getName()%>>&nbsp;**不得超过 10 个汉字</TD>
	</TR>

	<TR bgcolor="#FFFFFF"><TD colspan=2 align=center><BR>
	  <FONT color=#000000>
		<INPUT name=Submit type=submit value="确 定"> &nbsp;&nbsp;     
		<INPUT name=Submit2 type=reset value="清 除"></FONT><BR></TD>
	</TR>
  </form>
</TABLE>