<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
String value=request.getParameter("itemname");
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
	      Statement st = conn.createStatement();


	try{
	  	
	      String sql = "SELECT Item_id, Iname, Regulated_price, Inum FROM ITEM WHERE Iname='"+value+"'";
	      ResultSet rs = st.executeQuery(sql);
	      while(rs.next()) { %>
	      	 <tr>
	           <th>
	               �����۳ѹ�
	           </th>
	           <td> <%if(rs.getString(1)==null||rs.getString(1)=="")
	           {
	           %>
	           alert("��ٱ��Ͽ� �־����ϴ�");
	          <% }%>
	               <%= rs.getString(1) %>
	          
	           </td>
	           
	       </tr>
	        <tr>
	           <th>
	               �������̸�
	           </th>
	           <td>
	               <%= rs.getString(2) %>
	          
	           </td>
	           
	       </tr>
	        <tr>
	           <th>
	               ����
	           </th>
	           <td>
	               <%= rs.getString(3) %>
	          
	           </td>
	           
	       </tr>
	       
	        <tr>
	           <th>
	               ���
	           </th>
	           <td>
	               <%= rs.getString(4) %>
	          
	           </td>
	           
	       </tr>
	   <form action ="Shoppingbag.jsp" method="post">
            	<br /> alert("��ٱ��Ͽ� �־����ϴ�");
                <br />   <input type="hidden" value="<%=rs.getString(1) %>"  name="itemname" ><br>
             <input type="submit" value="��ٱ��Ͽ� �ֱ�">
             </form>
	       </br>
	    
	       <%
	      }


	          

	      } catch (Exception e) {       
	      out.println("DB ���� ����");
	      }  
%>
</body>
</html>