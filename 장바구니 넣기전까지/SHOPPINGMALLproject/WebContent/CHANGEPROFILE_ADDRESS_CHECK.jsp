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
<title> ChangeProfile_sex_check </title>
</head>
<body>
 
    <h1> �ּ� ���� Ȯ�� </h1>
    <%
        // new_hobby �� �ٷ� �� �������� CHANGEPROFILE_HOBBY.jsp ���� �Է��� ���ο� hobby �̴�
        String new_hobby = request.getParameter("change_type");
 			
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
            // USER_HOBBY �� new_hobby �� ����(SET) �ش޶�
            Statement st = conn.createStatement();
            String sql = "UPDATE CUSTOMER SET type ='" + new_hobby + "' WHERE Customer_id='"
                    + session.getAttribute("id") + "'";
            st.executeUpdate(sql);
            //ResultSet rs = st.executeQuery(sql);
 			
            // ������ ������ CHANGEPROFILE.jsp �������� ���ư���
            response.sendRedirect("PROFILE.jsp");
 
        } catch (Exception e) {
            out.println("DB ���� ����");
        }
    %>
 
</body>
</html>

