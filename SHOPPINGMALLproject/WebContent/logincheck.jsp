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
<title> Login_Check </title>
</head>
<body>
 
    <h1> �α��� üũ ������ </h1>
    
    <%
     String strUserName = "dkelab";
	  String strPassword = "*5DC0701CE78BDE4AA84ADB2C6C033C138383B496";
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
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
        Statement st = conn.createStatement();
        // ���� �Է��� id�� pw ���� DB�ȿ� �ִ��� Ȯ���Ѵ�
        String sql = "SELECT * from CUSTOMER where Customer_id = '"+user_id+"'AND Password='"+user_pw+"'";
        ResultSet rs = st.executeQuery(sql);
        System.out.println("Success!");
        // isLogin �� �α��� Ȯ�� ������ ���� ����
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next�� true ��� = ������ �ִ�
            isLogin = true;
        }
        
        // DB�� ���� ���� ������ �ִٸ�
        if(isLogin) {
            // ���� �α����� id�� pw�� session�� �����ϰ�
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            if(user_id=="admin")
            {
            	 response.sendRedirect("admin.jsp");    
            	
            }
            // ù �������� ����������
            response.sendRedirect("login.jsp");    
        } else {
            // DB�� �������� ������ ���ٸ� ���â�� ����ش�
            %> <script> alert("�α��� ����"); history.go(-1); </script> <%            
        }
        
        
    } catch (SQLException ex1) {
  	  System.err.println("Cannot get a connection: " + ex1.getMessage());
			System.exit(1);
    }	try {
		// Close the Statement object.
		//stmt.close(); 
		// Close the Connection object.
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    %>
 
</body>
</html>
