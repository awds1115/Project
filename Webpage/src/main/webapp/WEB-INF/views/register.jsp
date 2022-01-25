<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body align=center>
<form method="post" action="/page/regi_check">
    <table align=center>
        <tr>
            <td align=right>실명</td>
            <td><input type=text id=name name=name size=20></td>
            <td>성별</td>
            <td><input type=radio id=male name=gender value=male>남성
                <input type=radio id=female name=gender value=female>여성</td>
        </tr>

        <tr>
            <td align=right>아이디</td>
            <td><input type=text id=userid name=userid size=20>
<!--             	<button id=dupChk>중복체크</button> -->
            	</td>
        </tr>   
        <tr>
            <td align=right>비밀번호</td>
            <td><input type=password id=passcode1 name=passcode1></td>
            <td align=right>비밀번호 확인</td>
            <td><input type=password id=passcode2 name=passcode2></td>
        </tr>
        <tr>
            <td align=right>관심분야</td>
            <td align=left>
                <input type=checkbox name=interest value="정치">정치&nbsp;
                <input type=checkbox name=interest value="경제">경제&nbsp;
                <input type=checkbox name=interest value="사회">사회&nbsp;
                <input type=checkbox name=interest value="문화">문화&nbsp;<br>
                <input type=checkbox name=interest value="역사">역사&nbsp;
                <input type=checkbox name=interest value="연예">연예&nbsp;
                <input type=checkbox name=interest value="스포츠">스포츠&nbsp;
                <input type=checkbox name=interest value="예술">예술&nbsp;<br>
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <input type=submit value='가입완료'>&nbsp;
                <input type=button id=btncancel value='취소'>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>