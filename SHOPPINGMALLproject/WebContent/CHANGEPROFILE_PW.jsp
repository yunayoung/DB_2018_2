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
<title> ChangeProfile_pw </title>
</head>
<body>
 
    <h1> ��й�ȣ ���� </h1>
    <br /> <form action="CHANGEPROFILE_PW_CHECK.jsp" method="post" onsubmit="return input_check_func()">
    <br />
    <br /> ���� ��й�ȣ : <input id="now_pw" name="now_pw">
    <br />
    <br /> �ٲ� ��й�ȣ : <input id="change_pw" name="change_pw">
    <br /> 
    <br /> �ѹ��� �Է��ϼ��� : <input id="change_pw_check" name="change_pw_check">
    <br />
    <br /> <button> ���� </button>
    <br /> </form>
    
    <script>
    // input_check_func�� ȸ�����Կ� �ʿ��� 3���� ������ ���δ� ä�� �־����� check ���ش�
    // �̴� form onsubmit�� ���� �ߵ��Ǹ� return ���� false �� ��� �������� �����Ͱ� action= ��ǥ�� �Ѿ�� �ʰԵȴ�
    function input_check_func() {
        var now_pw = document.getElementById('now_pw').value;
        var change_pw = document.getElementById('change_pw').value;
        var change_pw_check = document.getElementById('change_pw_check').value;
        
        if(now_pw == null || change_pw == null || change_pw_check == null ||
           now_pw == ""   || change_pw == ""   || change_pw_check == "") {
            alert("������ ���ġ �ʴ´�");
            return false;
        } 
        // ���ο� ��й�ȣ�� ���ο� ��й�ȣ Ȯ�� input�� ���� ���� �ٸ��ٸ� ���â�� ���� false�� ��ȯ�ؼ� action�� ���´�
        else if ( change_pw != change_pw_check ) {
            alert("���ο� ��й�ȣ�� �ȸµ�");
            return false;
        } else {
            
            // input���� ��������, �� ��й�ȣ�� �� ��й�ȣ Ȯ�� ������ ����Ǹ� action=��ǥ �� �̵��Ѵ�
            // ���⼭ ���� ��й�ȣ�� �´��� �ȸ´����� Ȯ�ξ��Ѵ� ���� ��ƴ����
            return true;
        }
    }    
    </script>
 
</body>
</html>
