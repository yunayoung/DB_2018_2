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
       
        String sql = "SELECT Iname, Item_id FROM ITEM WHERE Category_id='13'";
       // st.executeUpdate(sql);
       
        ResultSet rs = st.executeQuery(sql);
        
     rs.next();
            %>
       
           
                     </br>  ������
                   	</br> 
                        <%= rs.getString(1)%>
                         <%= rs.getString(2)%>
                   	<form action="ITEM.jsp" method="Post" name ="frm1">
            <input type="hidden"  name="name" value="W835-0415"><br>
            <input type="submit" value="�����ۺ���">
        </form>
               
        
            <%
          
       
            %>
       
           
                     </br>  ������
                   	</br> 
                   	   <% rs.next();%>
                   	     <%= rs.getString(1)%>
                         <%= rs.getString(2)%>
                        
                   	<form action="result.jsp" method="post">
            <input type="hidden" name="name" value="W835-2510"><br>
            <input type="submit" value="�����ۺ���">
        </form>
                         </br>  ������
                   	</br> 
                   	   <% rs.next();%>
                         <%= rs.getString(1)%>
                           <%= rs.getString(2)%>
                        
                   	<form action="result.jsp" method="post">
            <input type="hidden"name="name"  value="W835-5784"><br>
            <input type="submit" value="�����ۺ���">
        </form>
                  </br>  ������
                   	</br> 
                   	   <% rs.next();%>
                        <%= rs.getString(1)%>
                          <%= rs.getString(2)%>
                        
                   	<form action="result.jsp" method="post">
            <input type="hidden"name="name"  value="W836-1749"><br>
            <input type="submit" value="�����ۺ���">
        </form>
        
            <%
        
    } catch (Exception e) {       
        out.println("DB ���� ����");
    }    
    %>
    <br />
    <br /> <button onClick="location.href='main.jsp'"> �������� ���ư��� </button>
 
</body>
</html>
