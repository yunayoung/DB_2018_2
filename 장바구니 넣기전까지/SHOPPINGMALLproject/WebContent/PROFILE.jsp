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
 
    <h1> ������������ </h1>
    <%
        out.println(session.getAttribute("id") + " �� ��������");        
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
        
        // sql ����
        try{
        Statement st = conn.createStatement();
       
        String sql = "SELECT * FROM CUSTOMER WHERE Customer_id='" + session.getAttribute("id") + "'";
        //st.executeUpdate(sql);
       
        ResultSet rs = st.executeQuery(sql);
       
        while(rs.next()) {
            %>
            <table border="1">
             <tr>
                    <th>
                        ���̵�
                    </th>
                    <td>
                        <%= rs.getString(1) %>
                   
                    </td>
                    
                </tr>
                <tr>
                    <th>
                        ��й�ȣ
                    </th>
                    <td>
                        <%= rs.getString(2) %>
                   
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_PW.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <th>
                        ���
                    </th>
                    <td><%= rs.getString(3) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_ADDRESS.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                    <tr>
                    <th>
                       ��ȭ��ȣ
                    </th>
                    <td><%= rs.getString(4) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_PHONE.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <th>
                     ��
                    </th>
                    <td><%= rs.getString(5) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_SEX.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <th>
                       ����
                    </th>
                    <td><%= rs.getString(6) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_AGE.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <th>
                     ����
                    </th>
                    <td><%= rs.getString(7) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_JOB.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
       
                
                <tr>
                    <th>
                       Ÿ��
                    </th>
                    <td><%= rs.getString(8) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_TYPE.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
                 <tr>
                    <th>
                       �̸�
                    </th>
                    <td><%= rs.getString(9) %>
                    </td>
                    <td>
                        <button onClick="location.href='CHANGEPROFILE_NAME.jsp'">
                            ����
                        </button>
                    </td>
                </tr>
                
            </table>
            <%
        }        
    } catch (Exception e) {       
        out.println("DB ���� ����");
    }    
    %>
    
    <br />
    <br /> <button onClick="location.href='main.jsp'"> �������� ���ư��� </button>
 
</body>
</html>
