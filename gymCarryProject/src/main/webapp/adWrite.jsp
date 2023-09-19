<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <style>

    </style>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./styles/adWrite.css" rel="stylesheet">
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
        
    <main>
        <form>
        <div class="title_wrapper">
            <div>
            제목
            </div>
            <input type="text" /> 
        </div>

        <div class="writer_wrapper">
            <div>
            작성자
            </div>
            <input type="text" /> 
        </div>

        <div class="locate_wrapper">
            <div>
            지역
            </div>
            <select>
                <option value="강남">강남</option>
                <option value="관악">관악</option>
                <option value="구로">구로</option>
                <option value="마포">마포</option>
                <option value="송파">송파</option>
                <option value="영등포">영등포</option>
                <option value="용산">용산</option>
            </select>
        </div>

        <div class="company_wrapper">
            <div>
            지점명
            </div>
            <input type="text" /> 
        </div>

        <div class="write_wrapper">
            <div>
            지점명
            </div>
            <textarea name="" placeholder="작성해주세요"></textarea>
        </div>

            <input type="submit" value="등록하기">
            <button type="button" onclick="location.href='adBoardList.jsp'">
            	취소하기
            </button>
        </form>
       

    </main>


    </header>
    </body>
</html>