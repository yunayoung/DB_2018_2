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
String number1=request.getParameter("num");
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
		String sql="select Inum from ITEM where Item_id='"+value+"'";
		ResultSet rs = st.executeQuery(sql);
		int b=0;
		while(rs.next())
		{
			b=Integer.parseInt(rs.getString(1));
		}
		int number2=Integer.parseInt(number1);
		if(b<number2)
		{
			%>
				
		    	 <script> alert("재고가 부족합니다"); history.go(-1); </script>
		          
			<% 
		}
		
		
		sql="select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"'";
		    rs = st.executeQuery(sql);
		    out.println(value);
		    while(rs.next())
		    {
		    	
		    String a=rs.getString(1);
		sql = "SELECT Item_id from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
		st.execute(sql);
		String value1=null;
		int check=0;
		while(rs.next())
		{
			value1=rs.getString(1);
			if (value.equals(value1))
			{
				//sql="UPDATE PUT_IN SET Item_num = Item_num +"+ num+" where ITEM.itime id="";
				check=1;
				break;
			}
			
		}
		if(check==0){
			sql = "INSERT INTO PUT_IN VALUES ("  
	                   + a + 
	                  ",'" + value+
	                   "',1,'" + session.getAttribute("id")+
	                  "')";
	          st.executeUpdate(sql);
	          break;
		    }
		
		}
		    
		    
	      sql = "SELECT Item_id from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
	       rs = st.executeQuery(sql);
	      System.out.println("123!");
	     // String a;
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
	      
	       
	        
	   <form action ="BUY.jsp">
            	<br />
                <br />   <input type="hidden" value="<%=rs.getString(1) %>"  name="itemname" ><br>
             <input type="submit" value="구매하기">
             </form>
	       </br>
	    
	       <%
	      }
	     
			
	          

	      } catch (Exception e) {       
	      out.println("DB 연동 실패");
	      }  
%>
   <br /> <button onClick="location.href='main.jsp'"> 뒤로가기 </button>
     <br /> <button onClick="location.href='JOIN.jsp'"> 구매하기 </button>
</body>
</html>