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
 
    <h1> ȸ������ ȭ�� </h1>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    <form action ="IDcheck.jsp">
            	<br /> ���̵�
                  <input type="text"  name="JOIN_id" >
             <input type="submit" value="���̵� �ߺ�Ȯ��"></form>
    <form name = "userInfo"action="JOINcheck.jsp" method="post" onsubmit="return check_func()">
    <table border="1">
        <tr>
            <th> ���̵� </th> <td> <input type ="text" id="JOIN_id" name="JOIN_id" onkeydown="inputIdChk()">
<!--                  <input type="button" id = "check_id"  onClick="location.href='IDcheck.jsp'" > -->
                    <input type="hidden" id="idDuplication" name ="idDuplication" value="idUncheck" >     
                    </td>
   			
        </tr>
        <tr>
            <th> ��й�ȣ </th> <td> <input type="password" id="JOIN_pw" name="JOIN_pw"> </td>
        </tr>
        <tr>
        	      <td id="title">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" id="passwordcheck"maxlength="15">
                    </td>
                </tr>

        <tr>
            <th> �ּ� </th> <td> <input id="JOIN_address" name="JOIN_address"> </td>
        </tr>
        <tr>
            <th> �޴�����ȣ </th> <td> <input id="JOIN_phonenumber" name="JOIN_phonenumber"> </td>
        </tr>
        <tr>
            <th> SEX </th> 
             <td>
             			
                        <input type="radio" name="JOIN_sex" value="m" >m
                        <input type="radio" name="JOIN_sex" value="f" >f
                     
                    </td>
        </tr>
         <tr>
            <th> AGE </th> <td> <input id="JOIN_age" name="JOIN_age"> </td>
        </tr>
        <tr>
            <th> JOB </th> <td> <input id="JOIN_job" name="JOIN_job"> </td>
        </tr>
         <tr>
            <th> TYPE </th>
             <td>
             			
                        <input type="radio" name="JOIN_type" value="R" >R
                        <input type="radio" name="JOIN_type" value="W" >W
                     	  <input type="radio" name="JOIN_type" value="E" >E
                    </td>
        </tr>
         <tr>
            <th> �̸� </th> <td> <input id="JOIN_name" name="JOIN_name"> </td>
        </tr>
    </table>
    <button> �����ϱ� </button>
      </form>
         
         
 
  
    
    <script>
    
    // input_check_func�� ȸ�����Կ� �ʿ��� 3���� ������ ���δ� ä�� �־����� check ���ش�
    // �̴� form onsubmit�� ���� �ߵ��Ǹ� return ���� false �� ��� �������� �����Ͱ� action= ��ǥ�� �Ѿ�� �ʰԵȴ�
    function check_func() {
     
    	var id = document.getElementById('JOIN_id').value;
    	var checkid = document.getElementById('idDuplication').value;
        var pw = document.getElementById('JOIN_pw').value;
        var pwcheck = document.getElementById('passwordcheck').value;
      
        var address = document.getElementById('JOIN_address').value;
        var phone = document.getElementById('JOIN_phonenumber').value;
        var form = document.userInfo;
				if(id==null||id==""){
					alert("���̵� �Է��ϼ���");
					return false;
				}
				
				//if(checkid!="idCheck"){
				//	alert("���̵� �ߺ��� üũ ���ּ���");
				//	return false;
				//}
				if(pw==null||pw==""){
					alert("��й�ȣ���� �Է��ϼ���");
					return false;
				}
				if(pwcheck==null||pwcheck==""){
					alert("��й�ȣ���� �Է��ϼ���");
					return false;
				}
				if(pw!=pwcheck){
					alert("��й�ȣ�� ���� �ϰ� �Է��ϼ���.");
					return false;
				}
				if(address==null||address==""){
					alert("�ּҸ� �Է��ϼ���");
					return false;
				}
				if(phone==null||phone==""){
					alert("��ȭ��ȣ�� �Է��ϼ���");
					return false;
				}
				else
					return true;
        
    }   
    function openIdChk(){
    	
    	var openWin;
    	openWin=window.open("IDcheck.jsp","childForm","width-570,height=350,resizable-=no");
    	//response.sendRedirect("IDcheck.jsp");  
    	
    }
    function inputIdChk(){
        document.userInfo.idDuplication.value ="idUncheck";
    }

    </script>
         <br /> <button onClick="location.href='login.jsp'">�ڷΰ��� </button>
</body>
</html>
