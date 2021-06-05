<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>popup</title>
    <style>
        #center{
        text-align: center;
        margin: 0 auto;
        margin-top: 30px
    }



        input[type="submit"] {
            width: 330px;
            height: 30px;
    }
    </style>
    
</head>

<body>
    <%
        year1 = Request.Form("year")
    %>
    <%
        set db  = server.createobject("ADODB.Connection")
        db.open("DSN=sukjimanghera; UID=; PW=")

    
        sql = "select 과목명 from 교과정보 where 학년='1'"
        set rs = db.execute(sql)

        db.close
        
    %>
    <form name="form1" action="bd.asp" method="POST">
        <table id="center">
            <tr>
                <td>학년도/학기</td> <td><input type="radio" name="sort" value="1">2021년 1학기 <input type="radio" name="sort" value="2">2021년 2학기</td>
            </tr>
            <tr>
                <td>학년</td> <td><input type="text" name="year2" value="<% Response.Write year1 %>"></td>
            </tr>
            <tr>
                <td>교과명</td> <td><% 
             
                     response.Write rs("과목명")
                
                
                 %></td>
            </tr>
            <tr>
                <td>학번</td> <td><input type="text" name="number"></td>
            </tr>
            <tr>
                <td>이름</td> <td><input type="text" name="sname"></td>
            </tr>
            <tr>
                <td>원점수</td> <td><input type="text" name="score"></td>
            </tr>
            <tr>
                <td>석차</td> <td><input type="text" name="place"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="저장" width="100"></td>
            </tr>
        </table>
        

        
    </form>

</body>
</html>