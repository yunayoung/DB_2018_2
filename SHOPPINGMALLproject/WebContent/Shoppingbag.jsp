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
</br>장바구니 
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
		
		System.out.println("123!");
	      String sql = "SELECT Item_id from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
	      ResultSet rs = st.executeQuery(sql);
	      System.out.println("123!");
	      while(rs.next()) { %>
	      	 <tr>
	           <th>
	               아이템넘버
	           </th>
	           <td>
	               <%= rs.getString(1) %>
	          
	           </td>
	           
	       </tr>
	        <tr>
	           <th>
	               아이템이름
	           </th>
	           <td>
	               <%= rs.getString(2) %>
	          
	           </td>
	           
	       </tr>
	      
	       
	        
	   <form action ="itemresult.jsp">
            	<br />
                <br />   <input type="hidden" value="<%=rs.getString(1) %>"  name="itemname" ><br>
             <input type="submit" value="장바구니에 넣기">
             </form>
	       </br>
	    
	       <%
	      }


	          

	      } catch (Exception e) {       
	      out.println("DB 연동 실패");
	      }  
%>
</body>
</html>