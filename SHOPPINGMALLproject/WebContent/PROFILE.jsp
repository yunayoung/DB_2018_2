<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ChangeProfile </title>
</head>
<body>
 
    <h1> 개인정보변경 </h1>
    <%
        out.println(session.getAttribute("id") + " 님 개인정보");        
    try {
        // 드라이버 로딩
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        // 관리자 Login
        String url = "jdbc:oracle:thin:@192.168.54.82:1521:myoracle";
        String id = "system";
        String pw = "891212";
        
         // 연결
        Connection conn = DriverManager.getConnection(url, id, pw); 
        
        // sql 구사
        Statement st = conn.createStatement();
        String sql = "SELECT * FROM USERTABLE WHERE USER_ID='" + session.getAttribute("id") + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
        while(rs.next()) {
            %>
            <table border="1">
                <tr>
                    <th>
                        비밀번호
                    </th>
                    <td>
                        <%= rs.getString("USER_PW") %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_PW.jsp'">
                            변경
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <th>
                        취미
                    </th>
                    <td><%= rs.getString("USER_HOBBY") %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_HOBBY.jsp'">
                            변경
                        </button>
                    </td>
                </tr>
            </table>
            <%
        }        
    } catch (Exception e) {       
        out.println("DB 연동 실패");
    }    
    %>
    
    <br />
    <br /> <button onClick="location.href='LOGIN.jsp'"> 메인으로 돌아가기 </button>
 
</body>
</html>
