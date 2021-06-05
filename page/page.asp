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
    <title>교과 우수상</title>

    <script language="javascript">
        function showPopup() 
        { 
            window.open("popup.asp", "a", "width=400, height=300, left=100, top=50"); 
        }
        </script>
        
        <style>
            table,tr,td{
            border-collapse : collapse;
            border : 1px solid black;
            margin: 0 auto;
            table-layout: fixed;
            text-align: center;
            }

            .magin{
                margin:0 auto;
                }

            .input{
                border: 1px solid white;
                text-align:left;
                width: 1274px;
                table-layout: fixed;
            }
            input[type="button"] {
            width: 200px;
            height: 50px;
    }
      </style>
</head>
<body>
    <h1 align="left">교과 우수상 입력</h1>

    <form name="form2" action="popup.asp" method="POST">

        <select name=year>
            <option value=1학년>1학년
            <option value=2학년>2학년
            <option value=3학년>3학년
        </select>
        <div class="input">
            <input type="submit" value="입력" >
        </div>
        <table align="center" width=1200 height=200>
            <tr bgcolor = "d3d3d3">
                <td>분류</td>
                <td>학년</td>
                <td>교과명</td>
                <td>학번</td>
                <td>이름</td>
                <td>원점수</td>
                <td>석차</td>
            </tr>

            <%
                set db=server.createobject("ADODB.Connection")
                db.open("DSN=sukjimanghera;UID=;PW=;")
                
                sql = "select * from 교과우수상"

                set rs = db.execute(sql)

                DO UNTIL rs.eof

                        response.Write "<tr>" & "<td>" & rs("분류id") & "</td>" & "<td>" & rs("학년") & "</td>" & "<td>" & rs("교과명") & "</td>" & "<td>" & rs("학번") & "</td>" & "<td>" & rs("이름") & "</td>" & "<td>" & rs("원점수") & "</td>" & "<td>" & rs("석차") & "</td>" & "</tr>"

                rs.movenext
                
                LOOP
                
                db.close
            %>
            
        </table>
    </form>    
  
</body>
</html>