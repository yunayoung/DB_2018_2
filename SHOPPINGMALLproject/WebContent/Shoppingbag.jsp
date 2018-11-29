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
		System.out.println("1");
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
			return; 
		}
		
		int a=0;
		sql="select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"'";
		    rs = st.executeQuery(sql);
			System.out.println("2");
		    //out.println(value);
		    while(rs.next())
		    {
		    	
		    	a=rs.getInt(1);
		sql = "SELECT Item_id from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
		
		rs=st.executeQuery(sql);
		System.out.println("3");
		String value1=null;
		int check=0;
	
		while(rs.next())
		{
			value1=rs.getString(1);
			if (value.equals(value1))
			{	
				check=1;
				sql="UPDATE PUT_IN SET Item_num = Item_num +"+number2+" where Item_id='"+value+"' AND customer_id='"+ session.getAttribute("id")+"'";
			     st.executeUpdate(sql);
			     System.out.println("update");
				
				break;
			}
			
		}
		System.out.println("시작");
		System.out.println(check);
		System.out.println(a);
		System.out.println(value);
		System.out.println(number2);
		if(check==0){
			sql = "INSERT INTO PUT_IN VALUES ("  
	                   + a + 
	                  ",'" + value+
	                   "',"+number2+",'" + session.getAttribute("id")+
	                  "')";
			
	          st.executeUpdate(sql);
	          
	  		System.out.println("4");
	          break;
		    }
		 break;
		}
		    
			System.out.println("넘어갈라나");
	      sql = "SELECT Item_id,Item_num from PUT_IN where Bag_id IN(select Bag_id from BAG where Ordered='n' and Customer_id='"+session.getAttribute("id")+"')and Customer_id='"+session.getAttribute("id")+"'";
	       rs = st.executeQuery(sql);
	      System.out.println("5");
	     // String a;
			int[] itemnum =new int[10];
			int sum=0;
	      while(rs.next()) { %>
	      	 
	      	 	<br /><tr>
	           <th>
	               아이템넘버
	           </th>
	           <td>
	               <%= rs.getString(1) %>
	          
	           </td>
	           
	       </tr>
	        <tr>
	           <th>
	               아이템 개수
	           </th>
	           <td>
	               <%= rs.getString(2) %>
	          	   <%  sum += rs.getInt(2); %>
	           </td>
	           
	       </tr>
				<br />
					<br />
	    
	       <%
	      }
	    
	    System.out.println(sum);
	     sql = "Update BAG SET Total_num ="+sum+" where Bag_id ="+a+" And Customer_id='"+session.getAttribute("id")+"'  ";
	     st.executeUpdate(sql);
	     System.out.println("6");
	     %>
				   <form action ="BUY.jsp">
            	<br />
                <br />   <input type="hidden" value="<%=value %>"  name="itemname" ><br>
                   <br />   <input type="hidden" value="<%=a %>"  name="bagnumber" ><br>
             <input type="submit" value="구매하기">
             </form>
	     
	       <% 
	          

	      } catch (Exception e) {       
	      out.println("DB 연동 실패");
	      }  
%>
   <br /> <button onClick="location.href='main.jsp'"> 뒤로가기 </button>
    
</body>
</html>