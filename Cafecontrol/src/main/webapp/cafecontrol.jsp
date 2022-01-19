<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페관리</title>
</head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='Control.css'>
<body>
<jsp:include page="header.jsp"/>
<table align="center">
        <tr>
            <td valign=top>
                <table class=bound>
                    <caption id=capt1>메뉴목록</caption>
                    <tr>
                        <td align="right" colspan=2>
                        	<button id=btnMenu >메뉴관리</button>
           			    </td>
                   </tr>
                    <tr>
                        <td colspan=2>
                            <select id=selMenu size=14 ></select>
                        </td>

                    </tr>
					<tr>
                        <td>메뉴코드</td>
                        <td><input type=text id=menucode readonly></td>
                    </tr>
                    <tr>
                        <td>메뉴명</td>
                        <td><input type=text id=menuname readonly></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input type=number id=count min=1></td>
                    </tr>
                    <tr>
                        <td>금액</td>
                        <td><input type=number id=price readonly></td>
                    </tr>
                    <tr>
                        <td><button id=btnReset>지우기</button></td>
                        <td align=right><button id=btnAdd>메뉴추가</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class=bound>
                    <caption id=capt1>주문목록</caption>
                    <tr><td id=ls><br></td></tr>
                    <tr>
                        <td colspan=2>
                            <select id=selOrder size=14></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액</td>
                        <td><input type=number id=total></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><input type=text id=mobile size=13></td>
                    </tr>
                    <tr>
                        <td colspan=2>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>주문취소</button></td>
                        <td align=right><button id=btnDone>주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class=bound >
                    <caption id=capt1>판매내역</caption>
                   <tr>
                        <td align=right colspan=2>
                        <button id=btnSum >판매실적</button>
           			    </td>
                   </tr>
                    <tr>
                        <td>
                            <select id=selSales size=18></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id=clean>초기화</button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id=dlgMenu title=메뉴 관리 >
       <table>
        <tr>
            <td>
                <select id=selMenu1 size=10></select>
            </td>
            <td>
                <table>
                <tr>
                    <td>메뉴코드</td><td><input type=text id=_menucode></td>
                </tr>
                <tr>
                    <td>메뉴명</td><td><input type=text id=_menuname></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price step=100 min=100 width=50px>원</td>
                </tr>
                <tr>
                    <td  colspan=2 align=center>
                        <button id=btnGo>작성완료</button>&nbsp;
                        <button id=reset>비우기</button>&nbsp;
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
    
    </div>
    <div id=dlgSales title=판매 실적 >
     <table align=center>
     	<tr>
     		<td>
     			<table>
     				<tr>
     					<td valign=top>
     						메뉴별 매출금액(가나다순)
     					</td>
     				</tr>
       				<tr>
         				<td valign=top>
            				<select id=selSales1 size=15></select>
         				</td>
         			</tr>
         		</table>
         	</td>
            <td valign=top>
            	<table>
            		<tr>
            			<td valign=top>
            				고객별 매출금액 (매출액순)
            			</td>
            		</tr>
            		<tr>
               			<td valign=top>
            				<select id=selSales2 size=15></select>
               			</td>
            		</tr>
            	</table>
            </td>
      	</tr>     
   </table>
</div>
<jsp:include page="footer.jsp" />
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script src='cafe.js'></script>

</html>