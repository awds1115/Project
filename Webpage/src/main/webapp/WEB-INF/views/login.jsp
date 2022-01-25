<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
 <table>
 <tr><td>아이디</td><td><input type=text id=id name=id></td></tr>
 <tr><td>비밀번호</td><td><input type=password id=pw name=pw></td></tr>
 <tr><td colspan=2 align=center><input type=submit id=log_chk value='로그인'>&nbsp;
 				   <input type=reset value='다시하기'></td></tr>
 <tr><td colspan=2 align=center><input type=button id=cancel value='취소'></td>
 	 <td><a href="register.jsp">회원가입</a></td></tr>
 </table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#log_chk',function(){
	$.post('/page/login_check',{},function(txt){
		console.log(txt);
		for(let i=0; i<txt.length; i++){
			if($('#id').val()==txt[i]['id'] && $('#pw').val()==txt[i]['pw']){
				alert($('#id').val()+"님 환영합니다.");
				$.post('/page/login_update',{id:$('#id').val()},function(txt){
						document.location='/page/';
				},'text');
				return false;
			} else {
				alert("아이디 또는 비밀번호가 맞지 않습니다.");
				return false;
				
			}
		}
	},'json')
})
</script>
</html>