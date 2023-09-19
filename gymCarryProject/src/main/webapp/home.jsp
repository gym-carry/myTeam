<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="login" class="gymCarryProject.UserDTO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
    * {
        box-sizing:border-box;
    }

    body{
        margin: 0;
    }

    ul{
        list-style-type: none;
    }

    a{
        color: inherit;
        text-decoration: none;
    }

    /*헤더*/
    /*헤더 네비게이션*/
    .header_nav {
        display: flex;
        position: absolute;
        right: 0;
        top: 0; 
        gap: 10px;
        margin-right: 20px;
    }

    .header_logo {
        margin-top: 30px;
        text-align: center;

    }

    /*메인*/
    /*메인 네비게이션*/
    .main_nav {
        display: flex;
        justify-content: space-around;
        margin-top: 50px;
        border-top:1px solid;
        border-bottom:1px solid;
        border-color: #1BBC9B;
    }

    .main_nav_li{
        margin: 19px 0;
        font-size: 20px;
    }

    /*메인*/
    .main {
        display: flex;
        justify-content: space-around;
    }


</style>
<title>메인화면</title>
</head>
<body>
 <div id="wrapper">
    
    <header>

        <ul class="header_nav">
            <li>
                <%=login.getId() %>님
            </li> 
            <li>
                <a href="main.html">로그아웃</a>
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

    <main class="main">

        <a href="#">
            <img src="리뷰로고.svg" alt="리뷰게시판 로고">
        </a>

        <a href="#">
            <img src="홍보로고.svg" alt="홍보게시판 로고">
        </a>   
    </main>

 </div>

</body>
</html>