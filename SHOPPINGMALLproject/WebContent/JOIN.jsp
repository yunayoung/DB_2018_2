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
<title> Join </title>
</head>
<body>
 
    <h1> ȸ������ </h1>
    <form action="JOIN_CHECK.jsp" method="post" onsubmit="return input_check_func()">
    <table border="1">
        <tr>
            <th> id </th> <td> <input id="JOIN_id" name="JOIN_id"> </td>
        </tr>
        <tr>
            <th> pw </th> <td> <input id="JOIN_pw" name="JOIN_pw"> </td>
        </tr>
        <tr>
            <th> ��� </th> <td> <input id="JOIN_hobby" name="JOIN_hobby"> </td>
        </tr>
    </table>
    <button> �����ϱ� </button>
    </form>
    
    <script>
    // input_check_func�� ȸ�����Կ� �ʿ��� 3���� ������ ���δ� ä�� �־����� check ���ش�
    // �̴� form onsubmit�� ���� �ߵ��Ǹ� return ���� false �� ��� �������� �����Ͱ� action= ��ǥ�� �Ѿ�� �ʰԵȴ�
    function input_check_func() {
        var id = document.getElementById('JOIN_id').value;
        var pw = document.getElementById('JOIN_pw').value;
        var hobby = document.getElementById('JOIN_hobby').value;
        
        if(id == null || pw == null || hobby == null ||
         id == ""   || pw == ""   || hobby == "") {
            alert("������ ���ġ �ʴ´�");
            return false;
        } else {
            // ��������� �����Ǹ� true�� ��ȯ�Ѵ� �̴� ���� �������� ������ action= ��ǥ�� �ѱ�ٴ°��� �ǹ�
            return true;
        }
    }    
    </script>
 
</body>
</html>
