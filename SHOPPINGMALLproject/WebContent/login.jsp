<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login </title>
</head>
<body>
 
    <%
        // ���� �α��ε� ���̵� ���ٸ� (= session�� ����� id�� ���ٸ�)
        if(session.getAttribute("id") == null) {
            %>
            <h1> �α��� ������ </h1> 
            <br /> <form action="logincheck.jsp" method="post">
            <br />
            <br /> <input name="input_id" type="text">
            <br />
            <br /> <input name="input_pw" type="password"> <button> �α��� </button>
            <br /> </form>
            <br /> <button onClick="location.href='JOIN.jsp'"> ȸ������ </button>
            <%
        } 
        // ���� �α��ε� ���̵� �ִٸ� (= session�� ����� id�� �ִٸ�)
        else {
            out.print(session.getAttribute("id") + " �� ȯ���մϴ�");
            %>
            <h1> Y&J SHOPPINGMALL </h1> 
            <br /> <form action="logout.jsp" method="post">
            <br />
            <br /> <button> �α׾ƿ� </button>
            <br />
            <br /> </form>
            <br /> <button onClick="location.href='CHANGEPROFILE.jsp'"> �������� ����</button>
            <%
        }
    %>
    
 
</body>
</html>