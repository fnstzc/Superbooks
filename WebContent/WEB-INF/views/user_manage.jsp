<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="incdb.jsp"%>
<%@ include file="sessionadmin.jsp"%>
<%DispMaster dispmaster = new DispMaster();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<meta http-equiv="refresh" content="60*60">
<title>财务管理系统</title>
<link rel="stylesheet" href="images/css.css" type="text/css" media="screen">
<script language="JavaScript" type="text/JavaScript">
function delpay()
{
   if(confirm("确定要删除此吗？"))
     return true;
   else
     return false;	 
}
</script>
</head>
<body topmargin=0>
<TABLE width=98% border=0 align=center cellPadding=6 cellSpacing=1 class="tableBorder">
	<TBODY>
	<TR align=center bgcolor="#ffffff">
		<Th width=6%>编号</Th>
		<Th width=16%>用户名称</Th>
		<Th width=15% bgcolor="#ffffff">真实姓名</Th>
		<Th width=25% bgcolor="#ffffff">所属部门</Th>
		<Th width=15% bgcolor="#ffffff">限制ip</Th>
		<Th width=23% bgcolor="#ffffff">操作</Th>
	</TR>

	<%	
	//获得用户信息
	Vector listmaster = new Vector();
	listmaster = dispmaster.masterOrderID();
	for(int i=0;i<listmaster.size();i++) {
	Master masterinfo = (Master)listmaster.elementAt(i);
	
	//获得用户所属部门信息
	DispClass dispclass = new DispClass();
    int id;
	%>
	<TR >
		<TD height="27" class=forumRow><div align="center"><%=masterinfo.getID()%></div></TD>
		<TD class=forumRow><div align="center"><A HREF="user_edit.jsp?id=<%=masterinfo.getID()%>" title="点击编辑"><%=masterinfo.getUserName()%></A></div></TD>
		<TD class=forumRow align=center><%=masterinfo.getUserTruename()%></TD>
		<TD class=forumRow align=center><%
		    id =masterinfo.getClassid();
			
			dispclass.setID(id);
	        IClass iclass = dispclass.idToClass();if (id==0){
			out.print("总管理员");
			}else{
			out.println(iclass.getName());
			}
	        
		%></TD>
		<TD class=forumRow align=center><%=masterinfo.getUserIpaddress()%></TD>
		<TD class=forumRow align=center><A HREF="user_edit.jsp?id=<%=masterinfo.getID()%>" title="点击编辑">编辑</A>&nbsp;
	  <%if (!masterinfo.getUserName().equals("admin"))	{%>|&nbsp;&nbsp;<A HREF="user_del.jsp?id=<%=masterinfo.getID()%>" title="点击删除" onClick="return delpay();">删除</A><%}%></TD>
	</TR>
	<%}%>
	</TBODY>
</TABLE>
