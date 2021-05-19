<%@Language="VBScript" CODEPAGE="65001" %>

<% 

  Response.CharSet="utf-8"

  Session.codepage="65001"

  Response.codepage="65001"

  Response.ContentType="text/html;charset=utf-8"

%>

<html>

<head>
    <meta charset="UTF-8">
    
    <title>hello</title>
</head>
<body>
    
    <table border="1">
            <tr>
                <td>학번</td>
                <td>이름</td>
                <td>성별</td>
                <td>전화번호</td>
                <td>생년월일</td>
            
            </tr>
            
    
        <%
            set db=server.createobject("ADODB.Connection")
            db.open("DSN=sukji;UID=;PW=;")
            
            sql = "select * from student"

            set rs = db.execute(sql)

            
            
            DO UNTIL rs.eof

                    response.Write "<tr>"
                    response.Write "<td>" & rs("학번") & "</td>"
                    response.Write "<td>" & rs("이름") & "</td>"
                    response.Write "<td>" & rs("성별") & "</td>"
                    response.Write "<td>" & rs("전화번호") & "</td>"
                    response.Write "<td>" & rs("생년월일") & "</td>" 
                    response.Write "</tr>"


            rs.movenext
            
            LOOP
            
            db.close
        %>
    
    </table>
    <form name="gotoa" action="a.html">
        <input type = "submit" value="입력으로 이동">
    </form>
</body>
</html>