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
<title> ChangeProfile_hobby </title>
</head>
<body>
 
    <h1> SEX ���� </h1>
    <br /> <form action="CHANGEPROFILE_SEX_CHECK.jsp" method="post" onsubmit="return input_check_func()">
    <br /> 
    <br /> ���� sex :
    <%
    String strUserName = "dkelab";
	  String strPassword = "dkelab522";
	 String strConnectString = "jdbc:mysql://155.230.36.58:3306/test";
	 String DBMS_DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
	 Connection conn = null;
		
		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName(DBMS_DRIVER_CLASS_NAME);
			// Get a Connection object 
			System.out.println("Success!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		
		      try{

		       conn = DriverManager.getConnection(strConnectString,strUserName, strPassword);
		
		      }catch (SQLException ex) {
		    	  System.err.println("Cannot get a connection: " + ex.getMessage());
					System.exit(1);
		      }
		    try{
 
            // sql ����
            // USERTABLE �ȿ��ִ� USER_ID= ���� �α����� ID �ʵ�� ����
            // USER_HOBBY ���� ���Ͷ�
            Statement st = conn.createStatement();
            String sql = "SELECT SEX FROM CUSTOMER WHERE Customer_id='" + session.getAttribute("id") +"'";
           // st.executeUpdate(sql);
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()) {
                // rs �ȿ� ����ִ� ���� �ִٸ� �� ���
                out.println(rs.getString(1));
            }
 
        } catch (Exception e) {
            out.println("DB ���� ����");
        }
    %>
    <br /> 
    <br /> �ٲ� sex: 
                  <input type="radio" id="change_sex" name="change_sex" value="m" >m
                        <input type="radio"id="change_sex" name="change_sex" value="f" >f
    <br /> 
    <br /> <button>����</button>
    <br /> </form>
    
    <script>
        // input_check_func�� ��̺��濡 �ʿ��� ������ ä�� �־����� check ���ش�
        // �̴� form onsubmit�� ���� �ߵ��Ǹ� return ���� false �� ��� �������� �����Ͱ� action= ��ǥ�� �Ѿ�� �ʰԵȴ�
        function input_check_func() {
            var change_sex = document.getElementById('change_sex').value;
 
            if (change_sex == null || change_sex == "") {
                alert("������ ���ġ �ʴ´�");
                return false;
            } else {
                // input�� �������� ������ ����Ǹ� action=��ǥ �� �̵��Ѵ�
                return true;
            }
        }
    </script>
  <br /> <button onClick="location.href='main.jsp'"> �������� ���ư��� </button>
</body>
</html>