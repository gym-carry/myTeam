<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<link rel="stylesheet" href="./styles/adBoardList.css">
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <header>

        <ul class="header_nav">
            <li>
                <a href="login.jsp">로그인</a>
            </li> 

            <li>
                <a href="register.jsp">회원가입</a>
            </li>

            <li>
                <a href=""><img src="마이페이지로고.svg" alt="마이페이지로고"></a>
            </li>  
        </ul> 


        <div class="header_logo">
            <img src="메인로고.svg" alt="짐캐리로고">
        </div>
        
    </header>
        

    <nav>
        
        <ul class="main_nav">
            <li class="main_nav_li">
                <a href="">리뷰</a>
            </li>
            <li class="main_nav_li">
                <a href="">홍보</a></li>
        </ul>

    </nav>

    <main>
    	<button type="button" onclick="location.href='adWrite.jsp'">글쓰기</button>
        <table>
            <thead>
                <tr>
              	    <th>번호</th>
		            <th>작성자</th>
		            <th>지역</th>
		            <th>지점명</th>
		            <th>제목</th>
		            <th>작성일</th>
		            <th>조회수</th>
                </tr>
            </thead>
            <tbody>
              <tr>
                  <td>1</td>
                  <td>hello</td>
                  <td>관악구</td>
                  <td>짐박스</td>
                  <td>짐박스 3호점 홍보</td>
                  <td>2</td>
                  <td>1</td>
              </tr>  
            </tbody>
        </table>
    </main>

    </body>
</html>