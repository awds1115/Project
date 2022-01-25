<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form method="POST" action="/page/logout_update">
<%String userid=(String) session.getAttribute("userid"); %>
<table id=home align=right>
	<tr>
		<td>
		<%	
// 					String userid=(String) session.getAttribute("userid");
				if(userid==null){ %>
					<a href='/page/login'>로그인</a>&nbsp;<a href='/page/register'>회원가입</a><%
				} else {
					%><%=userid%>&nbsp; <input type=submit id=logout value=로그아웃><%
				}	
	 %> 
		</td>
	</tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
</script>
</html>
